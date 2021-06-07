# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).


require_relative 'voice/client.rb'

# Models
require_relative 'voice/models/create_call_request.rb'
require_relative 'voice/models/create_call_response.rb'
require_relative 'voice/models/call_state.rb'
require_relative 'voice/models/modify_call_request.rb'
require_relative 'voice/models/modify_call_recording_request.rb'
require_relative 'voice/models/call_recording_metadata.rb'
require_relative 'voice/models/modify_conference_request.rb'
require_relative 'voice/models/conference_state.rb'
require_relative 'voice/models/conference_member_state.rb'
require_relative 'voice/models/conference_recording_metadata.rb'
require_relative 'voice/models/transcribe_recording_request.rb'
require_relative 'voice/models/transcription_response.rb'
require_relative 'voice/models/transcription_metadata.rb'
require_relative 'voice/models/transcript.rb'
require_relative 'voice/models/answer_fallback_method_enum.rb'
require_relative 'voice/models/answer_method_enum.rb'
require_relative 'voice/models/callback_method_enum.rb'
require_relative 'voice/models/conference_event_method_enum.rb'
require_relative 'voice/models/direction_enum.rb'
require_relative 'voice/models/disconnect_method_enum.rb'
require_relative 'voice/models/file_format_enum.rb'
require_relative 'voice/models/redirect_fallback_method_enum.rb'
require_relative 'voice/models/redirect_method_enum.rb'
require_relative 'voice/models/state_enum.rb'
require_relative 'voice/models/state1_enum.rb'
require_relative 'voice/models/status_enum.rb'

# Exceptions
require_relative 'voice/exceptions/api_error_exception.rb'
# Controllers
require_relative 'voice/controllers/base_controller.rb'
require_relative 'voice/controllers/api_controller.rb'
