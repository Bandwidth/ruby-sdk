=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.0

=end

# Common files
require 'bandwidth-sdk/api_client'
require 'bandwidth-sdk/api_error'
require 'bandwidth-sdk/version'
require 'bandwidth-sdk/configuration'

# Models
require 'bandwidth-sdk/models/account_statistics'
require 'bandwidth-sdk/models/answer_callback'
require 'bandwidth-sdk/models/bridge_complete_callback'
require 'bandwidth-sdk/models/bridge_target_complete_callback'
require 'bandwidth-sdk/models/call_direction_enum'
require 'bandwidth-sdk/models/call_recording_metadata'
require 'bandwidth-sdk/models/call_state'
require 'bandwidth-sdk/models/call_state_enum'
require 'bandwidth-sdk/models/callback_method_enum'
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
require 'bandwidth-sdk/models/create_call'
require 'bandwidth-sdk/models/create_call_response'
require 'bandwidth-sdk/models/create_lookup_response'
require 'bandwidth-sdk/models/create_message_request_error'
require 'bandwidth-sdk/models/create_participant_request'
require 'bandwidth-sdk/models/create_participant_response'
require 'bandwidth-sdk/models/deferred_result'
require 'bandwidth-sdk/models/device_api_version_enum'
require 'bandwidth-sdk/models/disconenct_callback'
require 'bandwidth-sdk/models/diversion'
require 'bandwidth-sdk/models/dtmf_callback'
require 'bandwidth-sdk/models/field_error'
require 'bandwidth-sdk/models/file_format_enum'
require 'bandwidth-sdk/models/forbidden_request'
require 'bandwidth-sdk/models/gather_callback'
require 'bandwidth-sdk/models/initiate_callback'
require 'bandwidth-sdk/models/list_message_direction_enum'
require 'bandwidth-sdk/models/list_message_item'
require 'bandwidth-sdk/models/lookup_request'
require 'bandwidth-sdk/models/lookup_result'
require 'bandwidth-sdk/models/lookup_status'
require 'bandwidth-sdk/models/lookup_status_enum'
require 'bandwidth-sdk/models/machine_detection_complete_callback'
require 'bandwidth-sdk/models/machine_detection_configuration'
require 'bandwidth-sdk/models/machine_detection_mode_enum'
require 'bandwidth-sdk/models/media'
require 'bandwidth-sdk/models/message'
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
require 'bandwidth-sdk/models/page_info'
require 'bandwidth-sdk/models/participant'
require 'bandwidth-sdk/models/participant_subscription'
require 'bandwidth-sdk/models/priority_enum'
require 'bandwidth-sdk/models/publish_permissions_enum'
require 'bandwidth-sdk/models/recording_available_callback'
require 'bandwidth-sdk/models/recording_complete_callback'
require 'bandwidth-sdk/models/recording_state_enum'
require 'bandwidth-sdk/models/redirect_callback'
require 'bandwidth-sdk/models/redirect_method_enum'
require 'bandwidth-sdk/models/request_error'
require 'bandwidth-sdk/models/session'
require 'bandwidth-sdk/models/stir_shaken'
require 'bandwidth-sdk/models/subscriptions'
require 'bandwidth-sdk/models/tag'
require 'bandwidth-sdk/models/tn_lookup_request_error'
require 'bandwidth-sdk/models/transcribe_recording'
require 'bandwidth-sdk/models/transcription'
require 'bandwidth-sdk/models/transcription_available_callback'
require 'bandwidth-sdk/models/transcription_list'
require 'bandwidth-sdk/models/transcription_metadata'
require 'bandwidth-sdk/models/transfer_answer_callback'
require 'bandwidth-sdk/models/transfer_complete_callback'
require 'bandwidth-sdk/models/transfer_disconnect_callback'
require 'bandwidth-sdk/models/unauthorized_request'
require 'bandwidth-sdk/models/update_call'
require 'bandwidth-sdk/models/update_call_recording'
require 'bandwidth-sdk/models/update_conference'
require 'bandwidth-sdk/models/update_conference_member'
require 'bandwidth-sdk/models/verify_code_request'
require 'bandwidth-sdk/models/verify_code_response'
require 'bandwidth-sdk/models/voice_api_error'
require 'bandwidth-sdk/models/voice_code_response'

# APIs
require 'bandwidth-sdk/api/calls_api'
require 'bandwidth-sdk/api/conferences_api'
require 'bandwidth-sdk/api/mfa_api'
require 'bandwidth-sdk/api/media_api'
require 'bandwidth-sdk/api/messages_api'
require 'bandwidth-sdk/api/participants_api'
require 'bandwidth-sdk/api/phone_number_lookup_api'
require 'bandwidth-sdk/api/recordings_api'
require 'bandwidth-sdk/api/sessions_api'
require 'bandwidth-sdk/api/statistics_api'

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
