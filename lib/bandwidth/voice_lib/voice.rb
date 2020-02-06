# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).


require_relative 'voice/client.rb'

# Models
require_relative 'voice/models/api_call_response.rb'
require_relative 'voice/models/api_create_call_request.rb'
require_relative 'voice/models/api_get_account_recordings_metadata_request.rb'
require_relative 'voice/models/api_modify_call_request.rb'
require_relative 'voice/models/modify_call_recording_state.rb'
require_relative 'voice/models/recording_metadata_response.rb'
require_relative 'voice/models/answer_method_enum.rb'
require_relative 'voice/models/direction_enum.rb'
require_relative 'voice/models/disconnect_method_enum.rb'
require_relative 'voice/models/file_format_enum.rb'
require_relative 'voice/models/redirect_method_enum.rb'
require_relative 'voice/models/state_enum.rb'
require_relative 'voice/models/state1_enum.rb'
require_relative 'voice/models/transcription_status_enum.rb'
require_relative 'voice/models/type_enum.rb'

# Exceptions
require_relative 'voice/exceptions/error_response_exception.rb'
# Controllers
require_relative 'voice/controllers/base_controller.rb'
require_relative 'voice/controllers/api_controller.rb'
require_relative 'bxml/bxml.rb'