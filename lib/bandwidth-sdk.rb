=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
Generator version: 7.8.0

=end

# Common files
require 'bandwidth-sdk/api_client'
require 'bandwidth-sdk/api_error'
require 'bandwidth-sdk/version'
require 'bandwidth-sdk/configuration'

# Models
require 'bandwidth-sdk/models/account_statistics'
require 'bandwidth-sdk/models/additional_denial_reason'
require 'bandwidth-sdk/models/address'
require 'bandwidth-sdk/models/answer_callback'
require 'bandwidth-sdk/models/bridge_complete_callback'
require 'bandwidth-sdk/models/bridge_target_complete_callback'
require 'bandwidth-sdk/models/call_direction_enum'
require 'bandwidth-sdk/models/call_recording_metadata'
require 'bandwidth-sdk/models/call_state'
require 'bandwidth-sdk/models/call_state_enum'
require 'bandwidth-sdk/models/call_transcription'
require 'bandwidth-sdk/models/call_transcription_detected_language_enum'
require 'bandwidth-sdk/models/call_transcription_metadata'
require 'bandwidth-sdk/models/call_transcription_response'
require 'bandwidth-sdk/models/call_transcription_track_enum'
require 'bandwidth-sdk/models/callback_method_enum'
require 'bandwidth-sdk/models/callback_type_enum'
require 'bandwidth-sdk/models/code_request'
require 'bandwidth-sdk/models/conference'
require 'bandwidth-sdk/models/conference_completed_callback'
require 'bandwidth-sdk/models/conference_created_callback'
require 'bandwidth-sdk/models/conference_member'
require 'bandwidth-sdk/models/conference_member_exit_callback'
require 'bandwidth-sdk/models/conference_member_join_callback'
require 'bandwidth-sdk/models/conference_recording_available_callback'
require 'bandwidth-sdk/models/conference_recording_metadata'
require 'bandwidth-sdk/models/conference_redirect_callback'
require 'bandwidth-sdk/models/conference_state_enum'
require 'bandwidth-sdk/models/contact'
require 'bandwidth-sdk/models/create_call'
require 'bandwidth-sdk/models/create_call_response'
require 'bandwidth-sdk/models/create_lookup_response'
require 'bandwidth-sdk/models/create_message_request_error'
require 'bandwidth-sdk/models/deferred_result'
require 'bandwidth-sdk/models/disconnect_callback'
require 'bandwidth-sdk/models/diversion'
require 'bandwidth-sdk/models/dtmf_callback'
require 'bandwidth-sdk/models/error'
require 'bandwidth-sdk/models/failure_webhook'
require 'bandwidth-sdk/models/field_error'
require 'bandwidth-sdk/models/file_format_enum'
require 'bandwidth-sdk/models/gather_callback'
require 'bandwidth-sdk/models/initiate_callback'
require 'bandwidth-sdk/models/links_object'
require 'bandwidth-sdk/models/list_message_direction_enum'
require 'bandwidth-sdk/models/list_message_item'
require 'bandwidth-sdk/models/lookup_request'
require 'bandwidth-sdk/models/lookup_result'
require 'bandwidth-sdk/models/lookup_status'
require 'bandwidth-sdk/models/lookup_status_enum'
require 'bandwidth-sdk/models/machine_detection_complete_callback'
require 'bandwidth-sdk/models/machine_detection_configuration'
require 'bandwidth-sdk/models/machine_detection_mode_enum'
require 'bandwidth-sdk/models/machine_detection_result'
require 'bandwidth-sdk/models/media'
require 'bandwidth-sdk/models/message'
require 'bandwidth-sdk/models/message_callback'
require 'bandwidth-sdk/models/message_callback_message'
require 'bandwidth-sdk/models/message_direction_enum'
require 'bandwidth-sdk/models/message_request'
require 'bandwidth-sdk/models/message_status_enum'
require 'bandwidth-sdk/models/message_type_enum'
require 'bandwidth-sdk/models/messages_list'
require 'bandwidth-sdk/models/messaging_code_response'
require 'bandwidth-sdk/models/messaging_request_error'
require 'bandwidth-sdk/models/mfa_forbidden_request_error'
require 'bandwidth-sdk/models/mfa_request_error'
require 'bandwidth-sdk/models/mfa_unauthorized_request_error'
require 'bandwidth-sdk/models/opt_in_workflow'
require 'bandwidth-sdk/models/page_info'
require 'bandwidth-sdk/models/priority_enum'
require 'bandwidth-sdk/models/recording_available_callback'
require 'bandwidth-sdk/models/recording_complete_callback'
require 'bandwidth-sdk/models/recording_state_enum'
require 'bandwidth-sdk/models/recording_transcription_metadata'
require 'bandwidth-sdk/models/recording_transcriptions'
require 'bandwidth-sdk/models/redirect_callback'
require 'bandwidth-sdk/models/redirect_method_enum'
require 'bandwidth-sdk/models/stir_shaken'
require 'bandwidth-sdk/models/tag'
require 'bandwidth-sdk/models/telephone_number'
require 'bandwidth-sdk/models/tfv_basic_authentication'
require 'bandwidth-sdk/models/tfv_callback_status_enum'
require 'bandwidth-sdk/models/tfv_error'
require 'bandwidth-sdk/models/tfv_status'
require 'bandwidth-sdk/models/tfv_status_enum'
require 'bandwidth-sdk/models/tfv_submission_info'
require 'bandwidth-sdk/models/tfv_submission_wrapper'
require 'bandwidth-sdk/models/tn_lookup_request_error'
require 'bandwidth-sdk/models/transcribe_recording'
require 'bandwidth-sdk/models/transcription'
require 'bandwidth-sdk/models/transcription_available_callback'
require 'bandwidth-sdk/models/transfer_answer_callback'
require 'bandwidth-sdk/models/transfer_complete_callback'
require 'bandwidth-sdk/models/transfer_disconnect_callback'
require 'bandwidth-sdk/models/update_call'
require 'bandwidth-sdk/models/update_call_recording'
require 'bandwidth-sdk/models/update_conference'
require 'bandwidth-sdk/models/update_conference_member'
require 'bandwidth-sdk/models/verification_denial_webhook'
require 'bandwidth-sdk/models/verification_request'
require 'bandwidth-sdk/models/verification_update_request'
require 'bandwidth-sdk/models/verification_webhook'
require 'bandwidth-sdk/models/verify_code_request'
require 'bandwidth-sdk/models/verify_code_response'
require 'bandwidth-sdk/models/voice_api_error'
require 'bandwidth-sdk/models/voice_code_response'
require 'bandwidth-sdk/models/webhook_subscription'
require 'bandwidth-sdk/models/webhook_subscription_basic_authentication'
require 'bandwidth-sdk/models/webhook_subscription_request_schema'
require 'bandwidth-sdk/models/webhook_subscription_type_enum'
require 'bandwidth-sdk/models/webhook_subscriptions_list_body'

# BXML
require 'bandwidth-sdk/models/bxml/root'
require 'bandwidth-sdk/models/bxml/bxml'
require 'bandwidth-sdk/models/bxml/response'
require 'bandwidth-sdk/models/bxml/verb'
require 'bandwidth-sdk/models/bxml/nestable_verb'
require 'bandwidth-sdk/models/bxml/verbs/bridge'
require 'bandwidth-sdk/models/bxml/verbs/conference'
require 'bandwidth-sdk/models/bxml/verbs/custom_param'
require 'bandwidth-sdk/models/bxml/verbs/forward'
require 'bandwidth-sdk/models/bxml/verbs/gather'
require 'bandwidth-sdk/models/bxml/verbs/hangup'
require 'bandwidth-sdk/models/bxml/verbs/pause_recording'
require 'bandwidth-sdk/models/bxml/verbs/pause'
require 'bandwidth-sdk/models/bxml/verbs/phone_number'
require 'bandwidth-sdk/models/bxml/verbs/play_audio'
require 'bandwidth-sdk/models/bxml/verbs/record'
require 'bandwidth-sdk/models/bxml/verbs/redirect'
require 'bandwidth-sdk/models/bxml/verbs/resume_recording'
require 'bandwidth-sdk/models/bxml/verbs/ring'
require 'bandwidth-sdk/models/bxml/verbs/send_dtmf'
require 'bandwidth-sdk/models/bxml/verbs/sip_uri'
require 'bandwidth-sdk/models/bxml/verbs/speak_sentence'
require 'bandwidth-sdk/models/bxml/verbs/start_gather'
require 'bandwidth-sdk/models/bxml/verbs/start_recording'
require 'bandwidth-sdk/models/bxml/verbs/start_stream'
require 'bandwidth-sdk/models/bxml/verbs/start_transcription'
require 'bandwidth-sdk/models/bxml/verbs/stop_gather'
require 'bandwidth-sdk/models/bxml/verbs/stop_recording'
require 'bandwidth-sdk/models/bxml/verbs/stop_stream'
require 'bandwidth-sdk/models/bxml/verbs/stop_transcription'
require 'bandwidth-sdk/models/bxml/verbs/stream_param'
require 'bandwidth-sdk/models/bxml/verbs/tag'
require 'bandwidth-sdk/models/bxml/verbs/transfer'

# APIs
require 'bandwidth-sdk/api/calls_api'
require 'bandwidth-sdk/api/conferences_api'
require 'bandwidth-sdk/api/mfa_api'
require 'bandwidth-sdk/api/media_api'
require 'bandwidth-sdk/api/messages_api'
require 'bandwidth-sdk/api/phone_number_lookup_api'
require 'bandwidth-sdk/api/recordings_api'
require 'bandwidth-sdk/api/statistics_api'
require 'bandwidth-sdk/api/toll_free_verification_api'
require 'bandwidth-sdk/api/transcriptions_api'

module Bandwidth
  class << self
    # Customize default settings for the SDK using block.
    #   Bandwidth.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
