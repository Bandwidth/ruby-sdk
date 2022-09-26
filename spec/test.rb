require 'test/unit'
require_relative '../lib/openapi_ruby_sdk.rb'
require 'securerandom'
require 'set'
include RubySdk

DATA = 0    # index for response array related to the response data
CODE = 1    # index for response array related to the status code

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

class ValidationTest < Test::Unit::TestCase
    RubySdk.configure do |config|
        # Configure HTTP basic authorization: httpBasic
        config.username = BW_USERNAME
        config.password = BW_PASSWORD
        #config.ssl_verify = false # remove for testing on push
    end
    
    #-----------Messaging and Media Tests-----------
    $api_instance_msg = RubySdk::MessagesApi.new()
    $api_instance_media = RubySdk::MediaApi.new()

    def test_create_message_sms     # Test sending an SMS message
        message_text = "ruby sdk test SMS"
        body = RubySdk::MessageRequest.new(
            application_id: BW_MESSAGING_APPLICATION_ID,
            to: [USER_NUMBER],
            from: BW_NUMBER,
            text: message_text
        )
        response = $api_instance_msg.create_message_with_http_info(BW_ACCOUNT_ID, body)
        assert_equal(202, response[CODE], "incorrect response code")
        assert_equal(29, response[DATA].id.length, "id not set")
        assert_equal(BW_NUMBER, response[DATA].owner, "message owner not correct")
        assert_equal(BW_NUMBER, response[DATA].from, "from number does not match")
        assert_equal([USER_NUMBER], response[DATA].to, "to number does not match")
        assert_equal(body.tag, response[DATA].tag, "tags do not match")
        assert_equal(body.media,response[DATA].media,  "media does not match")
        assert_equal(message_text, response[DATA].text, "message text does not match")
    end

    def test_create_message_mms     # Test sending an MMS message
        message_text = "ruby sdk test MMS"
        body = RubySdk::MessageRequest.new(
            application_id: BW_MESSAGING_APPLICATION_ID,
            to: [USER_NUMBER],
            from: BW_NUMBER,
            text: message_text,
            media: ["https://cdn2.thecatapi.com/images/MTY3ODIyMQ.jpg"]
        )
        response = $api_instance_msg.create_message_with_http_info(BW_ACCOUNT_ID, body)
        assert_equal(202, response[CODE], "incorrect response code")
        assert_equal(29, response[DATA].id.length, "id not set")
        assert_equal(BW_NUMBER, response[DATA].owner, "message owner not correct")
        assert_equal(BW_NUMBER, response[DATA].from, "from number does not match")
        assert_equal([USER_NUMBER], response[DATA].to, "to number does not match")
        assert_equal(body.tag, response[DATA].tag, "tags do not match")
        assert_equal(body.media,response[DATA].media,  "media does not match")
        assert_equal(message_text, response[DATA].text, "message text does not match")
    end

    def test_get_message    # Test to get most recent message from the BW_NUMBER
        get_opts = {
            :source_tn => BW_NUMBER,
            :message_direction => "OUTBOUND"
        }
        response = $api_instance_msg.get_messages_with_http_info(BW_ACCOUNT_ID, get_opts)
        assert_equal(200, response[CODE], "incorrect response code")
        assert_equal(BW_ACCOUNT_ID, response[DATA].messages[0].account_id, "account ids do not match")
        assert_equal("OUTBOUND", response[DATA].messages[0].message_direction, "message directions do not match")
        assert_equal(BW_NUMBER, response[DATA].messages[0].source_tn, "failed to get message from BW_NUMBER")
    end

    def test_create_message_invalid_phone_number    # Test to make sure correct errors are thrown when trying to send a text to an invalid number
        body = RubySdk::MessageRequest.new(
            application_id: BW_MESSAGING_APPLICATION_ID,
            to: ["+1invalid"],
            from: BW_NUMBER,
            text: "ruby sdk test"
        )
        e = assert_raise(RubySdk::ApiError, "expected exception not raised") do 
            $response = $api_instance_msg.create_message_with_http_info(BW_ACCOUNT_ID, body)
            
        end
        resp_body =  JSON.parse(e.response_body)
        expected_desc = "\'+1invalid\' must be replaced with a valid E164 formatted telephone number"
        assert_equal(400, e.code, "incorrect response code")
        assert_equal("request-validation", resp_body['type'], "response type does not match")
        assert_equal(expected_desc, resp_body['fieldErrors'][0]['description'], "error description does not match expected")
    end

    def test_valid_media    # Test Media Upload, List, Download, and Delete
        media_name = 'ruby_media' + SecureRandom.uuid
        media_data = '123456'

        # upload media
        up_response = $api_instance_media.upload_media_with_http_info(BW_ACCOUNT_ID, media_name, media_data)
        assert_equal(204, up_response[CODE], "incorrect response code")

        # list media
        list_media = $api_instance_media.list_media_with_http_info(BW_ACCOUNT_ID)
        assert_equal(200, list_media[CODE], "incorrect response code")
        assert(list_media[DATA][0].content_length > 0, "media data does not exist")

        # download media
        downloaded_media = $api_instance_media.get_media_with_http_info(BW_ACCOUNT_ID, media_name, debug_return_type: 'String')
        assert_equal(200, downloaded_media[CODE], "incorrect response code")
        assert_equal(media_data, downloaded_media[DATA], "downloaded media file not equal to upload")

        # delete media
        del_response = $api_instance_media.delete_media_with_http_info(BW_ACCOUNT_ID, media_name)
        assert_equal(204, del_response[CODE], "incorrect response code")
    end

    def test_get_delete_invalid_media      # Test to make sure correct errors are thrown when trying to list and get media that does not exist
        media_name = "invalid_media"
        # get media
        e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
            $api_instance_media.get_media_with_http_info(BW_ACCOUNT_ID, media_name, debug_return_type: 'String')
        end
        assert_equal(404, e.code, "incorrect response code")
        assert_equal("object-not-found", JSON.parse(e.response_body)['type'], "response error type does not match")

        # delete media (the fact that this returns a 204 is actually painful, but we need to verify ¯\_(ツ)_/¯)
        del_response = $api_instance_media.delete_media_with_http_info(BW_ACCOUNT_ID, media_name)
        assert_equal(204, del_response[CODE], "incorrect response code")
    end


    #-----------Voice Tests-----------
    $api_instance_voice = RubySdk::CallsApi.new()
    
    def test_create_call_and_get_call_state     # Test to create an outbound call and get its state
        amd_config = RubySdk::MachineDetectionConfiguration.new(
            mode: "async",
            detection_timeout: 5.0,
            silence_timeout: 5.0,
            speech_threshold: 5.0,
            speech_end_threshold: 5.0,
            delay_result: true,
            callback_url: BASE_CALLBACK_URL + "/machineDetection",
            callback_method: "POST"
        )
        call_body = RubySdk::CreateCallRequest.new(
            application_id: BW_VOICE_APPLICATION_ID,
            to: USER_NUMBER,
            from: BW_NUMBER,
            answer_url: BASE_CALLBACK_URL + "/callbacks/answer",
            answer_method: "POST",
            disconnect_url: BASE_CALLBACK_URL + "/callbacks/disconnect",
            disconnect_method: "GET",
            machine_detection: amd_config
        )
        call_response = $api_instance_voice.create_call_with_http_info(BW_ACCOUNT_ID, call_body)
        sleep(3)
        # asserts for creating call
        assert_equal(201, call_response[CODE], "incorrect response code")
        assert_equal(47, call_response[DATA].call_id.length, "id not set")
        assert_equal(BW_ACCOUNT_ID, call_response[DATA].account_id, "account id does not match")
        assert_equal(BW_VOICE_APPLICATION_ID, call_response[DATA].application_id, "application id does not match")
        assert_equal(USER_NUMBER, call_response[DATA].to, "to number does not match")
        assert_equal(BW_NUMBER, call_response[DATA].from, "from number does not match")
        assert_equal("https://voice.bandwidth.com/api/v2/accounts/" + BW_ACCOUNT_ID + "/calls/" + call_response[DATA].call_id, call_response[DATA].call_url, "call url does not match")
        assert(call_response[DATA].call_timeout.is_a?(Float), "incorrect call timeout data type")
        assert(call_response[DATA].callback_timeout.is_a?(Float), "incorrect callback timeout data type")
        assert(call_response[DATA].start_time.is_a?(Time), "incorrect start time data type")
        assert_equal("POST", call_response[DATA].answer_method, "answer method does not match")
        assert_equal("GET", call_response[DATA].disconnect_method, "disconnect method does not match")
        assert_equal(BASE_CALLBACK_URL + "/callbacks/answer", call_response[DATA].answer_url, "answer url does not match")
        assert_equal(BASE_CALLBACK_URL + "/callbacks/disconnect", call_response[DATA].disconnect_url, "disconnect url does not match")

        
        get_call_response = $api_instance_voice.get_call_with_http_info(BW_ACCOUNT_ID, call_response[DATA].call_id)
        #asserts for getting call state
        assert_equal(200, get_call_response[CODE], "incorrect response code")
        assert_equal(call_response[DATA].call_id, get_call_response[DATA].call_id, "call id does not match")
        assert_equal(BW_ACCOUNT_ID, get_call_response[DATA].account_id, "account id does not match")
        assert_equal(BW_VOICE_APPLICATION_ID, get_call_response[DATA].application_id, "application id does not match")
        assert(get_call_response[DATA].start_time.is_a?(Time), "incorrect start time data type")
        assert(get_call_response[DATA].last_update.is_a?(Time), "incorrect last update time data type")
        if get_call_response[DATA].answer_time
            assert(get_call_response[DATA].answer_time.is_a?(Time), "incorrect answer time data type")
        end
        if get_call_response[DATA].end_time
            assert(get_call_response[DATA].end_time.is_a?(Time), "incorrect end time data type")
        end
        if get_call_response[DATA].disconnect_cause == "error"
            assert(get_call_response[DATA].error_message.is_a?(String), "incorrect error message data type")
            assert_equal(36, get_call_response[DATA].error_id.length, "error id not set")
        end
    end

    def test_create_get_failed_call     # Test to make sure correct errors are thrown when trying to create a call incorrectly and get a call that does not exist
        call_body = RubySdk::CreateCallRequest.new(
            application_id: BW_VOICE_APPLICATION_ID,
            to: "+1invalid",
            from: BW_NUMBER,
            answer_url: BASE_CALLBACK_URL + "/callbacks/answer",
            answer_method: "POST",
            disconnect_url: BASE_CALLBACK_URL + "/callbacks/disconnect",
            disconnect_method: "GET"
        )

        dne_id = "does-not-exist"

        call_e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
            $api_instance_voice.create_call_with_http_info(BW_ACCOUNT_ID, call_body)
        end
        get_e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
            $api_instance_voice.get_call_with_http_info(BW_ACCOUNT_ID, dne_id)
        end

        # asserts for creating bad call
        assert_equal(400, call_e.code, "incorrect response code")
        assert_equal("validation", JSON.parse(call_e.response_body)['type'], "response error type does not match")
        assert(JSON.parse(call_e.response_body)['description'].is_a?(String), "incorrect error description type")

        # asserts for getting non-existent call
        assert_equal(404, get_e.code, "incorrect response code")
        #assert_equal("", JSON.parse(get_e.response_body)['type'], "response error type does not match") for some reason, this doesnt have a response body 🙃
        #assert(JSON.parse(get_e.response_body)['description'], "incorrect error description type")
    end

    #-----------MFA Tests-----------
    $api_instance_mfa = RubySdk::MFAApi.new()

    def test_mfa_messaging     # Test to send a messaging mfa code
    req_schema = RubySdk::TwoFactorCodeRequestSchema.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        message: "Your temporary {NAME} {SCOPE} code is: {CODE}",
        digits: 6
    )
    mfa_response = $api_instance_mfa.messaging_two_factor_with_http_info(BW_ACCOUNT_ID, req_schema)
    assert_equal(200, mfa_response[CODE], "incorrect response code")
    assert_equal(29, mfa_response[DATA].message_id.length, "message id not set")
    end

    def test_failed_mfa_messaging      # Test to make sure correct errors are thrown when trying to send a messaging mfa code incorrectly
    req_schema = RubySdk::TwoFactorCodeRequestSchema.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        message: "Your temporary {NAME} {SCOPE} code is: ",
        digits: 6
    )
    e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
        $api_instance_mfa.messaging_two_factor_with_http_info(BW_ACCOUNT_ID, req_schema)
    end
    assert_equal(400, e.code, "incorrect response code")
    assert_equal("{CODE} is required in MFA message", JSON.parse(e.response_body)['error'], "response error does not match")
    end

    def test_mfa_voice     # Test to send a voice mfa code
    req_schema = RubySdk::TwoFactorCodeRequestSchema.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_VOICE_APPLICATION_ID,
        message: "Your temporary {NAME} {SCOPE} code is: {CODE}",
        digits: 6
    )
    mfa_response = $api_instance_mfa.voice_two_factor_with_http_info(BW_ACCOUNT_ID, req_schema)
    assert_equal(200, mfa_response[CODE], "incorrect response code")
    assert_equal(47, mfa_response[DATA].call_id.length, "call id not set")
    end

    def test_failed_mfa_voice      # Test to make sure correct errors are thrown when trying to send a voice mfa code incorrectly
    req_schema = RubySdk::TwoFactorCodeRequestSchema.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_VOICE_APPLICATION_ID,
        message: "Your temporary {NAME} {SCOPE} code is: ",
        digits: 6
    )
    e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
        $api_instance_mfa.voice_two_factor_with_http_info(BW_ACCOUNT_ID, req_schema)
    end
    assert_equal(400, e.code, "incorrect response code")
    assert_equal("{CODE} is required in MFA message", JSON.parse(e.response_body)['error'], "response error does not match")
    end

    def test_mfa_verify # Test to verify a correct received mfa code
    omit("Currently no way to do this without receiving callbacks")
    req_schema = RubySdk::TwoFactorVerifyRequestSchema.new(
        to: "+1000" + rand(1...10000000).to_s,
        application_id: BW_VOICE_APPLICATION_ID,
        expiration_time_in_minutes: 3,
        code: "123456"
    )
    mfa_response = $api_instance_mfa.verify_two_factor_with_http_info(BW_ACCOUNT_ID, req_schema)
    assert_equal(200, mfa_response[CODE], "incorrect response code")
    assert(mfa_response[DATA].valid.is_a?(TrueClass), "incorrect valid data type")
    end

    def test_failed_mfa_verify     # Test to verify an incorrect received mfa code
    req_schema = RubySdk::TwoFactorVerifyRequestSchema.new(
        to: "+1000" + rand(1...10000000).to_s,
        application_id: BW_VOICE_APPLICATION_ID,
        expiration_time_in_minutes: 3,
        code: "12345"   # 5 digits so as to never match one randomly generated by previous tests
    )
    mfa_response = $api_instance_mfa.verify_two_factor_with_http_info(BW_ACCOUNT_ID, req_schema)
    assert_equal(200, mfa_response[CODE], "incorrect response code")
    assert(mfa_response[DATA].valid.is_a?(FalseClass), "incorrect valid data type")
    end

    #-----------WebRTC Tests-----------
    $api_instance_webrtc = RubySdk::SessionsApi.new()
    $api_instance_participants = RubySdk::ParticipantsApi.new()

    def test_webrtc_create_get_delete_session      # Test to create, get, and delete a webrtc session
    session_body = RubySdk::Session.new(
        tag: "ruby sdk test"
    )
    create_response = $api_instance_webrtc.create_session_with_http_info(BW_ACCOUNT_ID, session: session_body)
    assert_equal(200, create_response[CODE], "incorrect response code")
    assert_equal(36, create_response[DATA].id.length, "session id not set")
    assert_equal(session_body.tag.to_s, create_response[DATA].tag, "created session tag does not match expected")

    get_response = $api_instance_webrtc.get_session_with_http_info(BW_ACCOUNT_ID, create_response[DATA].id)
    assert_equal(200, get_response[CODE], "incorrect response code")
    assert_equal(create_response[DATA].id, get_response[DATA].id, "session id does not match")
    assert_equal(session_body.tag.to_s, get_response[DATA].tag, "gotten session tag does not match expected")

    del_response = $api_instance_webrtc.delete_session_with_http_info(BW_ACCOUNT_ID, create_response[DATA].id)
    assert_equal(204, del_response[CODE], "incorrect response code")
    end

    def test_failed_get_session     # Test to make sure correct errors are thrown when improperly trying to get session details
        malf_id = "invalid"
        dne_id = "11111111-2222-3333-4444-555555555555"
        expected_error = "Could not find session for id " + dne_id
        malf_e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
            $api_instance_webrtc.get_session_with_http_info(BW_ACCOUNT_ID, malf_id)
        end
        assert_equal(400, malf_e.code, "incorrect response code")
        assert_equal("Malformed session id", JSON.parse(malf_e.response_body)['error'], "response error does not match")

        dne_e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
            $api_instance_webrtc.get_session_with_http_info(BW_ACCOUNT_ID, dne_id)
        end
        assert_equal(404, dne_e.code, "incorrect response code")
        assert_equal(expected_error, JSON.parse(dne_e.response_body)['error'], "response error does not match")
    end

    def test_create_get_delete_participant      # Test to successfully create, get, and delete a webrtc participant
        part_body = RubySdk::Participant.new(
            publish_permissions: ["VIDEO", "AUDIO"],
            device_api_version: "V3",
            tag: "ruby sdk test"
        )
        create_response = $api_instance_participants.create_participant_with_http_info(BW_ACCOUNT_ID, participant: part_body)
        part_id = create_response[DATA].participant.id
        assert_equal(200, create_response[CODE], "incorrect response code")
        assert_equal(36, create_response[DATA].participant.id.length, "participant id not set")
        assert_equal(part_body.publish_permissions.to_set, create_response[DATA].participant.publish_permissions.to_set, "participant permissions do not match")
        assert_equal(part_body.device_api_version, create_response[DATA].participant.device_api_version, "participant api version does not match")
        assert_equal(part_body.tag, create_response[DATA].participant.tag, "participant tag does not match")

        get_response = $api_instance_participants.get_participant_with_http_info(BW_ACCOUNT_ID, part_id)
        assert_equal(200, get_response[CODE], "incorrect response code")
        assert_equal(part_id, get_response[DATA].id, "participant id does not match")
        assert_equal(part_body.publish_permissions.to_set, get_response[DATA].publish_permissions.to_set, "participant permissions do not match")
        assert_equal(part_body.device_api_version, get_response[DATA].device_api_version, "participant api version does not match")
        assert_equal(part_body.tag, get_response[DATA].tag, "participant tag does not match")

        del_response = $api_instance_participants.delete_participant_with_http_info(BW_ACCOUNT_ID, part_id)
        assert_equal(204, del_response[CODE], "incorrect response code")
    end

    def test_failed_create_get_delete_participant       # Test to make sure correct errors are thrown when using invalid participant info
        part_body_bad = RubySdk::Participant.new(
            publish_permissions: ["AUDIO", "VIDEO", "INVALID"],
            device_api_version: "V3",
            tag: "ruby sdk test invalid"
        )
        dne_id = "11111111-2222-3333-4444-555555555555"
        expected_error = "Could not find participant for id " + dne_id

        create_e = assert_raise(RubySdk::ApiError, "expected ecpetion not raised") do
            $api_instance_participants.create_participant_with_http_info(BW_ACCOUNT_ID, participant: part_body_bad)
        end
        assert_equal(400, create_e.code, "incorrect response code")
        
        get_e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
            $api_instance_participants.get_participant_with_http_info(BW_ACCOUNT_ID, dne_id)
        end
        assert_equal(404, get_e.code, "incorrect response code")
        assert_equal(expected_error, JSON.parse(get_e.response_body)['error'], "response error does not match")

        del_e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
            $api_instance_participants.delete_participant_with_http_info(BW_ACCOUNT_ID, dne_id)
        end
        assert_equal(404, del_e.code, "incorrect response code")
        assert_equal(expected_error, JSON.parse(del_e.response_body)['error'], "response error does not match")
    end

    #-----------TN Lookup Tests-----------
    $api_instance_tnlookup = RubySdk::PhoneNumberLookupApi.new()

    def test_create_get_tn_lookup   # Test to create and get the status of a TN Lookup Request
        tn_body = RubySdk::OrderRequest.new(
            tns: [BW_NUMBER]
        )
        create_response = $api_instance_tnlookup.lookup_request_with_http_info(BW_ACCOUNT_ID, tn_body)
        assert_equal(202, create_response[CODE], "incorrect response code")
        assert_equal(36, create_response[DATA].request_id.length, "request id not set")
        assert(create_response[DATA].status.is_a?(String), "incorrect status data type")

        sleep(1)

        req_id = create_response[DATA].request_id
        get_response = $api_instance_tnlookup.lookup_request_status_with_http_info(BW_ACCOUNT_ID, req_id)
        assert_equal(200, get_response[CODE], "incorrect response code")
        assert_equal(req_id, get_response[DATA].request_id, "request id does not match")
        assert(get_response[DATA].status.is_a?(String), "incorrect response status type")
        assert(get_response[DATA].result[0].response_code.is_a?(Integer), "incorrect response code type")
        assert_equal(BW_NUMBER, get_response[DATA].result[0].e_164_format, "phone number does not match")
    end

    def test_failed_create_get_tn_lookup    # Test to make sure correct errors are thrown when trying to improperly create and get a TN Lookup Request
        tn_body_bad = RubySdk::OrderRequest.new(
            tns: ["+1invalid"]
        )
        req_id_dne = "invalid"
        expected_error = "Some tns do not match e164 format: " + tn_body_bad.tns[0]
        #req_id_dne = "11111111-2222-3333-4444-555555555555"
        create_e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
            $api_instance_tnlookup.lookup_request_with_http_info(BW_ACCOUNT_ID, tn_body_bad)
        end
        assert_equal(400, create_e.code, "incorrect response type")
        assert_equal(expected_error, JSON.parse(create_e.response_body)['message'], "response error does not match")

        get_e = assert_raise(RubySdk::ApiError, "expected exception not raised") do
            $api_instance_tnlookup.lookup_request_status_with_http_info(BW_ACCOUNT_ID, req_id_dne)
        end
        assert_equal(404, get_e.code, "incorrect response type")
    end
end
