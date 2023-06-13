# test_integration.rb
#
# A simple integration test against Bandwidth's APIs

require 'test/unit'
require 'securerandom'
require_relative '../../lib/bandwidth.rb'

include Bandwidth
include Bandwidth::Voice
include Bandwidth::Messaging
include Bandwidth::MultiFactorAuth
include Bandwidth::WebRtc

begin
    BW_USERNAME = ENV.fetch("BW_USERNAME")
    BW_PASSWORD = ENV.fetch("BW_PASSWORD")
    BW_ACCOUNT_ID = ENV.fetch("BW_ACCOUNT_ID")
    BW_VOICE_APPLICATION_ID = ENV.fetch("BW_VOICE_APPLICATION_ID")
    BW_MESSAGING_APPLICATION_ID = ENV.fetch("BW_MESSAGING_APPLICATION_ID")
    BASE_CALLBACK_URL = ENV.fetch("BASE_CALLBACK_URL")
    BW_NUMBER = ENV.fetch("BW_NUMBER")
    USER_NUMBER = ENV.fetch("USER_NUMBER")
rescue
    puts "Environmental variables not found"
    exit(-1)
end

class IntegrationTest < Test::Unit::TestCase
    def setup
        @bandwidth_client = Bandwidth::Client.new(
            voice_basic_auth_user_name: BW_USERNAME,
            voice_basic_auth_password: BW_PASSWORD,
            messaging_basic_auth_user_name: BW_USERNAME,
            messaging_basic_auth_password: BW_PASSWORD,
            multi_factor_auth_basic_auth_user_name: BW_USERNAME,
            multi_factor_auth_basic_auth_password: BW_PASSWORD,
            phone_number_lookup_basic_auth_user_name: BW_USERNAME,
            phone_number_lookup_basic_auth_password: BW_PASSWORD
        )

        @bandwidth_client_invalid_auth = Bandwidth::Client.new(
            voice_basic_auth_user_name: "bad_username",
            voice_basic_auth_password: "bad_password",
            messaging_basic_auth_user_name: "bad_username",
            messaging_basic_auth_password: "bad_password",
            multi_factor_auth_basic_auth_user_name: "bad_username",
            multi_factor_auth_basic_auth_password: "bad_password",
            phone_number_lookup_basic_auth_user_name: "bad_username",
            phone_number_lookup_basic_auth_password: "bad_password"
        )
    end

    def test_create_message
        body = MessageRequest.new
        body.application_id = BW_MESSAGING_APPLICATION_ID
        body.to = [USER_NUMBER]
        body.from = BW_NUMBER
        body.text = "Ruby Integration"
        body.priority = "high"
        body.expiration = "2091-02-01T11:29:18-05:00"
        response = @bandwidth_client.messaging_client.client.create_message(BW_ACCOUNT_ID, body)
        assert(response.data.to == [USER_NUMBER])
        assert(response.data.from == BW_NUMBER)
        assert(response.data.text == "Ruby Integration")
        assert(response.data.priority == "high")
        assert(response.data.expiration == "2091-02-01T11:29:18-05:00")
        assert(response.data.id.length > 0, "id value not set") #validate that _some_ id was returned
    end

    def test_create_message_invalid_phone_number
        body = MessageRequest.new
        body.application_id = BW_MESSAGING_APPLICATION_ID
        body.to = ["+1invalid"]
        body.from = BW_NUMBER
        body.text = "Ruby Integration"
        begin
            @bandwidth_client.messaging_client.client.create_message(BW_ACCOUNT_ID, body)
            #workaround to make sure that if the above error is not raised, the build will fail
            assert(false, "Expected exception not raised")
        rescue MessagingException => e
            assert(e.description.length > 0, "description value not set")
        end
    end

    def test_upload_download_media
        #define constants for upload media and download media
        media_id = "text-media-id-" + SecureRandom.uuid
        media = "Hello world"

        #media upload
        @bandwidth_client.messaging_client.client.upload_media(BW_ACCOUNT_ID, media_id, media, :content_type => "text/plain", :cache_control => "no-cache")

        #media download
        downloaded_media = @bandwidth_client.messaging_client.client.get_media(BW_ACCOUNT_ID, media_id).data

        assert_equal(downloaded_media, media, "Downloaded media file not equal to upload")
    end

    def test_get_message
        # Send a successful request to the GET messages API
        response = @bandwidth_client.messaging_client.client.get_messages(BW_ACCOUNT_ID, :message_id => "abc123")
        assert_equal(response.status_code, 200, "API did not return a 200 OK")
    end 

    def test_get_message_invalid_auth
        # Send an unsuccessful request to the GET messages API
        assert_raise MessagingException do
            response = @bandwidth_client_invalid_auth.messaging_client.client.get_messages(BW_ACCOUNT_ID)
        end
    end 

    def test_create_call_and_get_call_state
        body = CreateCallRequest.new
        body.from = BW_NUMBER
        body.to = USER_NUMBER
        body.application_id = BW_VOICE_APPLICATION_ID
        body.answer_url = BASE_CALLBACK_URL
        response = @bandwidth_client.voice_client.client.create_call(BW_ACCOUNT_ID, body)
        assert(response.data.call_id.length > 0, "call_id value not set")
        assert_not_nil(response.data.enqueued_time, "enqueued time is nil")
        assert(response.data.enqueued_time.is_a?(DateTime), "enqueued time is not a DateTime object")

        #Get phone call information
        sleep(2)
        begin
            response = @bandwidth_client.voice_client.client.get_call(BW_ACCOUNT_ID, response.data.call_id)
            assert(response.data.state.length > 0, "state value not set")
            assert_not_nil(response.data.enqueued_time, "enqueued time is nil")
            assert(response.data.enqueued_time.is_a?(DateTime), "enqueued time is not a DateTime object")
        rescue ApiErrorException => e
            if e.response_code != 404
                raise StandardError, "Unexpected HTTP Response: " + e.message
            end
        end
            
    end

    def test_create_call_with_amd_and_get_call_state
        machine_detection = MachineDetectionConfiguration.new
        machine_detection.mode = 'async'
        machine_detection.detection_timeout = 5.0
        machine_detection.silence_timeout = 5.0
        machine_detection.speech_threshold = 5.0
        machine_detection.speech_end_threshold = 5.0
        machine_detection.delay_result = true
        machine_detection.callback_url = BASE_CALLBACK_URL + '/machineDetection'
        machine_detection.callback_method = 'POST'
        machine_detection.machine_speech_end_threshold = 3.2

        body = CreateCallRequest.new
        body.from = BW_NUMBER
        body.to = USER_NUMBER
        body.application_id = BW_VOICE_APPLICATION_ID
        body.answer_url = BASE_CALLBACK_URL
        body.machine_detection = machine_detection
        response = @bandwidth_client.voice_client.client.create_call(BW_ACCOUNT_ID, body)
        assert(response.data.call_id.length > 0, "call_id value not set")

        #Get phone call information
        sleep(2)
        begin
            response = @bandwidth_client.voice_client.client.get_call(BW_ACCOUNT_ID, response.data.call_id)
            assert(response.data.state.length > 0, "state value not set")
        rescue ApiErrorException => e
            if e.response_code != 404
                raise StandardError, "Unexpected HTTP Response: " + e.message
            end
        end
    end

    def test_create_call_with_priority
        body = CreateCallRequest.new
        body.from = BW_NUMBER
        body.to = USER_NUMBER
        body.application_id = BW_VOICE_APPLICATION_ID
        body.answer_url = BASE_CALLBACK_URL
        body.priority = 1

        response = @bandwidth_client.voice_client.client.create_call(BW_ACCOUNT_ID, body)
        assert(response.data.call_id.length > 0, "call_id value not set")
        assert(response.data.priority == 1, "priority not set")
    end

    def test_create_call_invalid_phone_number
        body = CreateCallRequest.new
        body.from = BW_NUMBER
        body.to = "+1invalid"
        body.application_id = BW_VOICE_APPLICATION_ID
        body.answer_url = BASE_CALLBACK_URL

        begin
            @bandwidth_client.voice_client.client.create_call(BW_ACCOUNT_ID, :body => body)
            #workaround to make sure that if the above error is not raised, the build will fail
            assert(false, "Expected exception not raised")
        rescue ApiErrorException => e
            assert(e.description.length > 0, "description value not set")
        end
    end

    def test_forward
        forward = Bandwidth::Voice::Forward.new({
            :to => "+15554443333",
            :from => "+13334445555",
            :call_timeout => 25,
            :diversion_treatment => "none",
            :diversion_reason => "away"
        })

        response = Bandwidth::Voice::Response.new()
        response.push(forward)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Forward to="+15554443333" from="+13334445555" callTimeout="25" diversionTreatment="none" diversionReason="away"/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_gather
        gather = Bandwidth::Voice::Gather.new({
            :gather_url => "https://test.com",
            :gather_method => "POST",
            :username => "user",
            :password => "pass",
            :tag => "tag",
            :terminating_digits => "#",
            :max_digits => 3,
            :inter_digit_timeout => 5,
            :first_digit_timeout => "10",
            :repeat_count => 1,
            :gather_fallback_url => "https://test.com",
            :gather_fallback_method => "GET",
            :fallback_username => "fuser",
            :fallback_password => "fpass"
        })

        response = Bandwidth::Voice::Response.new()
        response.push(gather)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Gather gatherUrl="https://test.com" gatherMethod="POST" terminatingDigits="#" tag="tag" maxDigits="3" interDigitTimeout="5" username="user" password="pass" firstDigitTimeout="10" repeatCount="1" gatherFallbackUrl="https://test.com" gatherFallbackMethod="GET" fallbackUsername="fuser" fallbackPassword="fpass"></Gather></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_gather_nested_speak_sentence
        speak_sentence = Bandwidth::Voice::SpeakSentence.new({
            :sentence => "test"
        })
        gather = Bandwidth::Voice::Gather.new({
            :speak_sentence => speak_sentence
        })

        response = Bandwidth::Voice::Response.new()
        response.push(gather)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Gather><SpeakSentence>test</SpeakSentence></Gather></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_gather_nested_play_audio
        play_audio = Bandwidth::Voice::PlayAudio.new({
            :url => "https://test.com"
        })
        gather = Bandwidth::Voice::Gather.new({
            :play_audio => play_audio
        })

        response = Bandwidth::Voice::Response.new()
        response.push(gather)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Gather><PlayAudio>https://test.com</PlayAudio></Gather></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_gather_multiple_nested_verbs
        play_audio = Bandwidth::Voice::PlayAudio.new({
            :url => "https://test.com"
        })
        speak_sentence = Bandwidth::Voice::SpeakSentence.new({
            :sentence => "test"
        })
        gather = Bandwidth::Voice::Gather.new({
            :nested_verbs => [play_audio, speak_sentence]
        })

        response = Bandwidth::Voice::Response.new()
        response.push(gather)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Gather><PlayAudio>https://test.com</PlayAudio><SpeakSentence>test</SpeakSentence></Gather></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_empty_bxml_verb
        bxml = Bandwidth::Voice::Bxml.new()

        expected = '<?xml version="1.0" encoding="UTF-8"?><Bxml></Bxml>'
        actual = bxml.to_bxml()
        assert_equal(expected, actual)
    end

    def test_speak_sentence_pause
        bxml = Bandwidth::Voice::Bxml.new()

        speak_sentence = Bandwidth::Voice::SpeakSentence.new({
            :sentence => "new modify call bxml is pog",
            :voice => "Julie"
        })

        pause = Bandwidth::Voice::Pause.new({
            :duration => 6
        })

        bxml.push(speak_sentence)
        bxml.push(pause)

        expected = '<?xml version="1.0" encoding="UTF-8"?><Bxml><SpeakSentence voice="Julie">new modify call bxml is pog</SpeakSentence><Pause duration="6"/></Bxml>'
        actual = bxml.to_bxml()
        assert_equal(expected, actual)
    end

    def test_hangup
        hangup = Bandwidth::Voice::Hangup.new()

        response = Bandwidth::Voice::Response.new()
        response.push(hangup)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Hangup/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_pause
        pause = Bandwidth::Voice::Pause.new({
            :duration => 2
        })

        response = Bandwidth::Voice::Response.new()
        response.push(pause)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Pause duration="2"/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_pause_recording
        pause_recording = Bandwidth::Voice::PauseRecording.new()

        response = Bandwidth::Voice::Response.new()
        response.push(pause_recording)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><PauseRecording/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_play_audio
        play_audio = Bandwidth::Voice::PlayAudio.new({
            :url => "https://test.com",
            :username => "user",
            :password => "pass"
        })

        response = Bandwidth::Voice::Response.new()
        response.push(play_audio)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><PlayAudio username="user" password="pass">https://test.com</PlayAudio></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_record
        record = Bandwidth::Voice::Record.new({
            :record_complete_url => "https://complete.com",
            :record_complete_method => "POST",
            :recording_available_url => "https://available.com",
            :recording_available_method => "GET",
            :transcribe => false,
            :detect_language=> true,
            :transcription_available_url => "https://transcribe.com",
            :transcription_available_method => "POST",
            :username => "user",
            :password => "pass",
            :tag => "tag",
            :terminating_digits => "#",
            :max_duration => 3,
            :silence_timeout => 5,
            :file_format => "wav",
            :record_complete_fallback_url => "https://test.com",
            :record_complete_fallback_method => "GET",
            :fallback_username => "fuser",
            :fallback_password => "fpass"
        })

        response = Bandwidth::Voice::Response.new()
        response.push(record)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Record tag="tag" username="user" password="pass" recordCompleteUrl="https://complete.com" recordCompleteMethod="POST" recordingAvailableUrl="https://available.com" recordingAvailableMethod="GET" terminatingDigits="#" maxDuration="3" fileFormat="wav" transcribe="false" detectLanguage="true" transcriptionAvailableUrl="https://transcribe.com" transcriptionAvailableMethod="POST" silenceTimeout="5" recordCompleteFallbackUrl="https://test.com" recordCompleteFallbackMethod="GET" fallbackUsername="fuser" fallbackPassword="fpass"/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_redirect
        redirect = Bandwidth::Voice::Redirect.new({
            :redirect_url => "https://redirect.com",
            :redirect_method => "GET",
            :username => "user",
            :password => "pass",
            :tag => "tag",
            :redirect_fallback_url => "https://test.com",
            :redirect_fallback_method => "GET",
            :fallback_username => "fuser",
            :fallback_password => "fpass"
        })

        response = Bandwidth::Voice::Response.new()
        response.push(redirect)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Redirect redirectUrl="https://redirect.com" redirectMethod="GET" tag="tag" username="user" password="pass" redirectFallbackUrl="https://test.com" redirectFallbackMethod="GET" fallbackUsername="fuser" fallbackPassword="fpass"/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_resume_recording
        resume_recording = Bandwidth::Voice::ResumeRecording.new()

        response = Bandwidth::Voice::Response.new()
        response.push(resume_recording)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><ResumeRecording/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_send_dtmf
        send_dtmf = Bandwidth::Voice::SendDtmf.new({
            :dtmf => "12w34",
            :tone_duration => 75,
            :tone_interval => 65
        })

        response = Bandwidth::Voice::Response.new()
        response.push(send_dtmf)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><SendDtmf toneDuration="75" toneInterval="65">12w34</SendDtmf></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_speak_sentence
        speak_sentence = Bandwidth::Voice::SpeakSentence.new({
            :sentence => "test",
            :voice => "julie",
            :gender => "female",
            :locale => "en_US"
        })

        response = Bandwidth::Voice::Response.new()
        response.push(speak_sentence)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><SpeakSentence voice="julie" locale="en_US" gender="female">test</SpeakSentence></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_speak_sentence_ssml
        speak_sentence = Bandwidth::Voice::SpeakSentence.new({
            :sentence => 'Hello, you have reached the home of <lang xml:lang="es-MX">Antonio Mendoza</lang>.Please leave a message.',
        })

        response = Bandwidth::Voice::Response.new()
        response.push(speak_sentence)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><SpeakSentence>Hello, you have reached the home of <lang xml:lang="es-MX">Antonio Mendoza</lang>.Please leave a message.</SpeakSentence></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_start_recording
        start_recording = Bandwidth::Voice::StartRecording.new({
            :recording_available_url => "https://available.com",
            :recording_available_method => "POST",
            :transcribe => false,
            :transcription_available_url => "https://transcribe.com",
            :transcription_available_method => "GET",
            :username => "user",
            :password => "pass",
            :tag => "tag",
            :file_format => "mp3",
            :multi_channel => true
        })

        response = Bandwidth::Voice::Response.new()
        response.push(start_recording)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StartRecording tag="tag" username="user" password="pass" recordingAvailableUrl="https://available.com" recordingAvailableMethod="POST" fileFormat="mp3" multiChannel="true" transcribe="false" transcriptionAvailableUrl="https://transcribe.com" transcriptionAvailableMethod="GET"/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_stop_recording
        stop_recording = Bandwidth::Voice::StopRecording.new()

        response = Bandwidth::Voice::Response.new()
        response.push(stop_recording)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StopRecording/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_transfer
        phone_number = Bandwidth::Voice::PhoneNumber.new({
            :number => "+15554443333",
            :transfer_answer_url => "https://phoneanswer.com",
            :transfer_answer_method => "GET",
            :transfer_disconnect_url => "https://phonedisconnect.com",
            :transfer_disconnect_method => "POST",
            :username => "phoneuser",
            :password => "phonepassword",
            :tag => "phonetag",
            :transfer_answer_fallback_url => "https://test.com",
            :transfer_answer_fallback_method => "GET",
            :fallback_username => "fuser",
            :fallback_password => "fpass"
        })
        transfer = Bandwidth::Voice::Transfer.new({
            :transfer_caller_id => "+13334445555",
            :call_timeout => 3,
            :transfer_complete_url => "https://transfercomplete.com",
            :transfer_complete_method => "POST",
            :username => "transferuser",
            :password => "transferpass",
            :tag => "transfertag",
            :diversion_treatment => "none",
            :diversion_reason => "away",
            :phone_numbers => [phone_number],
            :transfer_complete_fallback_url => "https://test.com",
            :transfer_complete_fallback_method => "GET",
            :fallback_username => "fusern",
            :fallback_password => "fpassw"
        })

        response = Bandwidth::Voice::Response.new()
        response.push(transfer)
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Transfer transferCallerId="+13334445555" callTimeout="3" tag="transfertag" transferCompleteUrl="https://transfercomplete.com" transferCompleteMethod="POST" username="transferuser" password="transferpass" diversionTreatment="none" diversionReason="away" transferCompleteFallbackUrl="https://test.com" transferCompleteFallbackMethod="GET" fallbackUsername="fusern" fallbackPassword="fpassw"><PhoneNumber transferAnswerUrl="https://phoneanswer.com" transferAnswerMethod="GET" transferDisconnectUrl="https://phonedisconnect.com" transferDisconnectMethod="POST" username="phoneuser" password="phonepassword" tag="phonetag" transferAnswerFallbackUrl="https://test.com" transferAnswerFallbackMethod="GET" fallbackUsername="fuser" fallbackPassword="fpass">+15554443333</PhoneNumber></Transfer></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_conference
        conference = Bandwidth::Voice::Conference.new({
            :conference_name => 'my-conference',
            :mute => false,
            :hold => true,
            :call_ids_to_coach => "c-123,c-234",
            :conference_event_url => "https://test.com",
            :conference_event_method => "POST",
            :username => "user",
            :password => "pass",
            :tag => "tag",
            :conference_event_fallback_url => "https://test2.com",
            :conference_event_fallback_method => "POST",
            :fallback_username => "fuser",
            :fallback_password => "fpass"
        })
        response = Bandwidth::Voice::Response.new()
        response.push(conference)

        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Conference mute="false" hold="true" callIdsToCoach="c-123,c-234" conferenceEventUrl="https://test.com" conferenceEventMethod="POST" username="user" password="pass" tag="tag" conferenceEventFallbackUrl="https://test2.com" conferenceEventFallbackMethod="POST" fallbackUsername="fuser" fallbackPassword="fpass">my-conference</Conference></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_conference_coach_ids_array
        conference = Bandwidth::Voice::Conference.new({
            :conference_name => 'my-conference',
            :call_ids_to_coach => ["c-123", "c-234"],
        })
        response = Bandwidth::Voice::Response.new()
        response.push(conference)

        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Conference callIdsToCoach="c-123,c-234">my-conference</Conference></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_conference_no_coach
        conference = Bandwidth::Voice::Conference.new({
            :conference_name => 'my-conference'
        })
        response = Bandwidth::Voice::Response.new()
        response.push(conference)

        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Conference>my-conference</Conference></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_mfa_messaging
        body = TwoFactorCodeRequestSchema.new
        body.from = BW_NUMBER
        body.to = USER_NUMBER
        body.application_id = BW_MESSAGING_APPLICATION_ID
        body.scope = "scope"
        body.digits = 6
        body.message = "Your temporary {NAME} {SCOPE} code is {CODE}"

        response = @bandwidth_client.multi_factor_auth_client.mfa.create_messaging_two_factor(BW_ACCOUNT_ID, body)
        assert(response.data.message_id.length > 0, "message id value not set")
    end

    def test_mfa_voice
        body = TwoFactorCodeRequestSchema.new
        body.from = BW_NUMBER
        body.to = USER_NUMBER
        body.application_id = BW_VOICE_APPLICATION_ID
        body.scope = "scope"
        body.digits = 6
        body.message = "Your temporary {NAME} {SCOPE} code is {CODE}"

        response = @bandwidth_client.multi_factor_auth_client.mfa.create_voice_two_factor(BW_ACCOUNT_ID, body)
        assert(response.data.call_id.length > 0, "call id value not set")
    end

    def test_mfa_verify
        body = TwoFactorVerifyRequestSchema.new
        body.to = "+1000" + rand(1111111..9999999).to_s
        body.application_id = BW_VOICE_APPLICATION_ID
        body.scope = "scope"
        body.code = "123456"
        body.expiration_time_in_minutes = 3
        response = @bandwidth_client.multi_factor_auth_client.mfa.create_verify_two_factor(BW_ACCOUNT_ID, body)
        #Ruby has no check to see if variables are of type boolean
        #An explicit true/false check is required
        assert(response.data.valid == true || response.data.valid == false, "'valid' variable is not a boolean")
    end

    def test_bridge
        bridge = Bandwidth::Voice::Bridge.new({
            :call_id => "c-c-95ac8d6e-1a31c52e-b38f-4198-93c1-51633ec68f8d",
            :bridge_complete_url => "https://test.com",
            :bridge_complete_method => "POST",
            :bridge_target_complete_url => "https://test2.com",
            :bridge_target_complete_method => "GET",
            :username => "user",
            :password => "pass",
            :tag => "custom tag",
            :bridge_complete_fallback_url => "https://test3.com",
            :bridge_complete_fallback_method => "GET",
            :bridge_target_complete_fallback_url => "https://test4.com",
            :bridge_target_complete_fallback_method => "POST",
            :fallback_username => "fuser",
            :fallback_password => "fpass"
        })

        response = Bandwidth::Voice::Response.new()
        response.push(bridge)

        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Bridge bridgeCompleteUrl="https://test.com" bridgeCompleteMethod="POST" bridgeTargetCompleteUrl="https://test2.com" bridgeTargetCompleteMethod="GET" username="user" password="pass" tag="custom tag" bridgeCompleteFallbackUrl="https://test3.com" bridgeCompleteFallbackMethod="GET" bridgeTargetCompleteFallbackUrl="https://test4.com" bridgeTargetCompleteFallbackMethod="POST" fallbackUsername="fuser" fallbackPassword="fpass">c-c-95ac8d6e-1a31c52e-b38f-4198-93c1-51633ec68f8d</Bridge></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_ring
        ring = Bandwidth::Voice::Ring.new({
            :duration => 5,
            :answer_call => false
        })

        response = Bandwidth::Voice::Response.new()
        response.push(ring)

        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Ring duration="5" answerCall="false"/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_start_gather
        start_gather = Bandwidth::Voice::StartGather.new({
            :username => "user",
            :password => "pass",
            :tag => "custom tag",
            :dtmf_url => "https://test.com",
            :dtmf_method => "GET"
        })

        response = Bandwidth::Voice::Response.new()
        response.push(start_gather)

        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StartGather username="user" password="pass" tag="custom tag" dtmfUrl="https://test.com" dtmfMethod="GET"/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_stop_gather
        stop_gather = Bandwidth::Voice::StopGather.new()

        response = Bandwidth::Voice::Response.new()
        response.push(stop_gather)

        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StopGather/></Response>'
        actual = response.to_bxml()
        assert_equal(expected, actual)
    end

    def test_tn_lookup
        body = OrderRequest.new
        body.tns = [BW_NUMBER]
        create_response = @bandwidth_client.phone_number_lookup_client.client.create_lookup_request(BW_ACCOUNT_ID, body)
        assert(create_response.data.request_id.length > 0, "request_id value not set")

        request_id = create_response.data.request_id
        get_response = @bandwidth_client.phone_number_lookup_client.client.get_lookup_request_status(BW_ACCOUNT_ID, request_id)
        assert(get_response.data.status.length > 0, "status value not set")
    end

    def test_webrtc_generate_bxml
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><Transfer><SipUri uui="93d6f3c0be5845960b744fa28015d8ede84bd1a4;encoding=base64,asdf;encoding=jwt">sip:sipx.webrtc.bandwidth.com:5060</SipUri></Transfer></Response>'
        actual = Bandwidth::WebRtc.generate_bxml('asdf', 'c-93d6f3c0-be584596-0b74-4fa2-8015-d8ede84bd1a4')
        assert_equal(expected, actual)
    end

    def test_webrtc_generate_transfer_bxml_verb
        expected = '<Transfer><SipUri uui="93d6f3c0be5845960b744fa28015d8ede84bd1a4;encoding=base64,asdf;encoding=jwt">sip:sipx.webrtc.bandwidth.com:5060</SipUri></Transfer>'
        actual = Bandwidth::WebRtc.generate_transfer_bxml_verb('asdf', 'c-93d6f3c0-be584596-0b74-4fa2-8015-d8ede84bd1a4')
        assert_equal(expected, actual)
    end

    def test_start_stream_bxml_verb
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StartStream destination="https://www.test.com/stream" name="test_stream" tracks="inbound" streamEventUrl="https://www.test.com/event" streamEventMethod="POST" username="username" password="password"><StreamParam name="name1" value="value1"/></StartStream></Response>'
        response = Bandwidth::Voice::Response.new()

        stream_param1 = Bandwidth::Voice::StreamParam.new({
            :name => "name1",
            :value => "value1"
        })
        
        start_stream = Bandwidth::Voice::StartStream.new({
            :destination => "https://www.test.com/stream",
            :name => "test_stream",
            :tracks => "inbound",
            :streamEventUrl => "https://www.test.com/event",
            :streamEventMethod => "POST",
            :username => "username",
            :password => "password",
            :stream_params => stream_param1
        })

        response.push(start_stream)
        actual = response.to_bxml()

        assert_equal(expected, actual)
    end

    def test_start_stream_multiple_nested_stream_params
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StartStream destination="https://www.test.com/stream" name="test_stream" tracks="inbound" streamEventUrl="https://www.test.com/event" streamEventMethod="POST" username="username" password="password"><StreamParam name="name1" value="value1"/><StreamParam name="name2" value="value2"/></StartStream></Response>'
        response = Bandwidth::Voice::Response.new()

        stream_param1 = Bandwidth::Voice::StreamParam.new({
            :name => "name1",
            :value => "value1"
        })

        stream_param2 = Bandwidth::Voice::StreamParam.new({
            :name => "name2",
            :value => "value2"
        })

        start_stream = Bandwidth::Voice::StartStream.new({
            :destination => "https://www.test.com/stream",
            :name => "test_stream",
            :tracks => "inbound",
            :streamEventUrl => "https://www.test.com/event",
            :streamEventMethod => "POST",
            :username => "username",
            :password => "password",
            :nested_verbs => [stream_param1, stream_param2]
        })

        response.push(start_stream)
        actual = response.to_bxml()

        assert_equal(expected, actual)
    end

    def test_stop_stream_bxml_verb
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StopStream name="test_stream"/></Response>'
        response = Bandwidth::Voice::Response.new()
        stop_stream = Bandwidth::Voice::StopStream.new({
            :name => "test_stream"
        })
        response.push(stop_stream)
        actual = response.to_bxml()

        assert_equal(expected, actual)
    end

    def test_start_transcription_bxml_verb
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StartTranscription name="test_transcription" tracks="inbound" transcriptionEventUrl="https://www.test.com/event" transcriptionEventMethod="POST" username="username" password="password" destination="https://www.test.com/transcription"><CustomParam name="name1" value="value1"/></StartTranscription></Response>'
        response = Bandwidth::Voice::Response.new()

        custom_param1 = Bandwidth::Voice::CustomParam.new({
            :name => "name1",
            :value => "value1"
        })
        
        start_transcription = Bandwidth::Voice::StartTranscription.new({
            :name => "test_transcription",
            :tracks => "inbound",
            :transcriptionEventUrl => "https://www.test.com/event",
            :transcriptionEventMethod => "POST",
            :username => "username",
            :password => "password",
            :destination => "https://www.test.com/transcription",
            :custom_params => custom_param1
        })

        response.push(start_transcription)
        actual = response.to_bxml()

        assert_equal(expected, actual)
    end

    def test_start_transcription_multiple_nested_custom_params
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StartTranscription name="test_transcription" tracks="inbound" transcriptionEventUrl="https://www.test.com/event" transcriptionEventMethod="POST" username="username" password="password" destination="https://www.test.com/transcription"><CustomParam name="name1" value="value1"/><CustomParam name="name2" value="value2"/></StartTranscription></Response>'
        response = Bandwidth::Voice::Response.new()

        custom_param1 = Bandwidth::Voice::CustomParam.new({
            :name => "name1",
            :value => "value1"
        })

        custom_param2 = Bandwidth::Voice::CustomParam.new({
            :name => "name2",
            :value => "value2"
        })

        start_transcription = Bandwidth::Voice::StartTranscription.new({
            :destination => "https://www.test.com/transcription",
            :name => "test_transcription",
            :tracks => "inbound",
            :transcriptionEventUrl => "https://www.test.com/event",
            :transcriptionEventMethod => "POST",
            :username => "username",
            :password => "password",
            :nested_verbs => [custom_param1, custom_param2]
        })

        response.push(start_transcription)
        actual = response.to_bxml()

        assert_equal(expected, actual)
    end

    def test_stop_transcription_bxml_verb
        expected = '<?xml version="1.0" encoding="UTF-8"?><Response><StopTranscription name="test_transcription"/></Response>'
        response = Bandwidth::Voice::Response.new()
        stop_transcription = Bandwidth::Voice::StopTranscription.new({
            :name => "test_transcription"
        })
        response.push(stop_transcription)
        actual = response.to_bxml()

        assert_equal(expected, actual)
    end
end
