# bandwidth-sdk

[![Gem Version](https://badge.fury.io/rb/bandwidth-sdk.svg)](https://badge.fury.io/rb/bandwidth-sdk)
[![Tests](https://github.com/Bandwidth/ruby-sdk/actions/workflows/test-nightly.yml/badge.svg)](https://github.com/Bandwidth/ruby-sdk/actions/workflows/test-nightly.yml)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)


| **OS** | **Ruby** |
|:---:|:---:|
| Windows 2019 | 2.7, 3.0, 3.1, 3.2, 3.3 |
| Windows 2022 | 2.7, 3.0, 3.1, 3.2, 3.3 |
| Ubuntu 20.04 | 2.7, 3.0, 3.1, 3.2, 3.3 |
| Ubuntu 22.04 | 2.7, 3.0, 3.1, 3.2, 3.3 |

Bandwidth - the Ruby gem for the Bandwidth SDK

### Generated with the command:
`openapi-generator generate -g ruby -i bandwidth.yml -c openapi-config.yml -o ./`

Bandwidth's Communication APIs

This SDK is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0.0
- Package version: 1.0.0-dev
- Build package: org.openapitools.codegen.languages.RubyClientCodegen
For more information, please visit [https://dev.bandwidth.com](https://dev.bandwidth.com)

## Installation

### Install from RubyGems

```shell
gem install bandwidth-sdk
```

### Build a gem

To build the Ruby code into a gem:

```shell
gem build bandwidth-sdk.gemspec
```

Then either install the gem locally:

```shell
gem install ./bandwidth-sdk-1.0.0-dev.gem
```

(for development, run `gem install --dev ./bandwidth-sdk-1.0.0-dev.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'bandwidth-sdk', '~> 1.0.0-dev'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'bandwidth-sdk', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:

```ruby
# Load the gem
require 'bandwidth-sdk'

# Setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR_USERNAME'
  config.password = 'YOUR_PASSWORD'
  # Configure faraday connection
  config.configure_faraday_connection { |connection| 'YOUR CONNECTION CONFIG PROC' }
end

api_instance = Bandwidth::CallsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
create_call = Bandwidth::CreateCall.new({to: '+19195551234', from: '+15555551212', application_id: '1234-qwer-5679-tyui', answer_url: 'https://www.myCallbackServer.example/webhooks/answer'}) # CreateCall | JSON object containing information to create an outbound call

begin
  #Create Call
  result = api_instance.create_call(account_id, create_call)
  p result
rescue Bandwidth::ApiError => e
  puts "Exception when calling CallsApi->create_call: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*Bandwidth::CallsApi* | [**create_call**](docs/CallsApi.md#create_call) | **POST** /accounts/{accountId}/calls | Create Call
*Bandwidth::CallsApi* | [**get_call_state**](docs/CallsApi.md#get_call_state) | **GET** /accounts/{accountId}/calls/{callId} | Get Call State Information
*Bandwidth::CallsApi* | [**list_calls**](docs/CallsApi.md#list_calls) | **GET** /accounts/{accountId}/calls | Get Calls
*Bandwidth::CallsApi* | [**update_call**](docs/CallsApi.md#update_call) | **POST** /accounts/{accountId}/calls/{callId} | Update Call
*Bandwidth::CallsApi* | [**update_call_bxml**](docs/CallsApi.md#update_call_bxml) | **PUT** /accounts/{accountId}/calls/{callId}/bxml | Update Call BXML
*Bandwidth::ConferencesApi* | [**download_conference_recording**](docs/ConferencesApi.md#download_conference_recording) | **GET** /accounts/{accountId}/conferences/{conferenceId}/recordings/{recordingId}/media | Download Conference Recording
*Bandwidth::ConferencesApi* | [**get_conference**](docs/ConferencesApi.md#get_conference) | **GET** /accounts/{accountId}/conferences/{conferenceId} | Get Conference Information
*Bandwidth::ConferencesApi* | [**get_conference_member**](docs/ConferencesApi.md#get_conference_member) | **GET** /accounts/{accountId}/conferences/{conferenceId}/members/{memberId} | Get Conference Member
*Bandwidth::ConferencesApi* | [**get_conference_recording**](docs/ConferencesApi.md#get_conference_recording) | **GET** /accounts/{accountId}/conferences/{conferenceId}/recordings/{recordingId} | Get Conference Recording Information
*Bandwidth::ConferencesApi* | [**list_conference_recordings**](docs/ConferencesApi.md#list_conference_recordings) | **GET** /accounts/{accountId}/conferences/{conferenceId}/recordings | Get Conference Recordings
*Bandwidth::ConferencesApi* | [**list_conferences**](docs/ConferencesApi.md#list_conferences) | **GET** /accounts/{accountId}/conferences | Get Conferences
*Bandwidth::ConferencesApi* | [**update_conference**](docs/ConferencesApi.md#update_conference) | **POST** /accounts/{accountId}/conferences/{conferenceId} | Update Conference
*Bandwidth::ConferencesApi* | [**update_conference_bxml**](docs/ConferencesApi.md#update_conference_bxml) | **PUT** /accounts/{accountId}/conferences/{conferenceId}/bxml | Update Conference BXML
*Bandwidth::ConferencesApi* | [**update_conference_member**](docs/ConferencesApi.md#update_conference_member) | **PUT** /accounts/{accountId}/conferences/{conferenceId}/members/{memberId} | Update Conference Member
*Bandwidth::MFAApi* | [**generate_messaging_code**](docs/MFAApi.md#generate_messaging_code) | **POST** /accounts/{accountId}/code/messaging | Messaging Authentication Code
*Bandwidth::MFAApi* | [**generate_voice_code**](docs/MFAApi.md#generate_voice_code) | **POST** /accounts/{accountId}/code/voice | Voice Authentication Code
*Bandwidth::MFAApi* | [**verify_code**](docs/MFAApi.md#verify_code) | **POST** /accounts/{accountId}/code/verify | Verify Authentication Code
*Bandwidth::MediaApi* | [**delete_media**](docs/MediaApi.md#delete_media) | **DELETE** /users/{accountId}/media/{mediaId} | Delete Media
*Bandwidth::MediaApi* | [**get_media**](docs/MediaApi.md#get_media) | **GET** /users/{accountId}/media/{mediaId} | Get Media
*Bandwidth::MediaApi* | [**list_media**](docs/MediaApi.md#list_media) | **GET** /users/{accountId}/media | List Media
*Bandwidth::MediaApi* | [**upload_media**](docs/MediaApi.md#upload_media) | **PUT** /users/{accountId}/media/{mediaId} | Upload Media
*Bandwidth::MessagesApi* | [**create_message**](docs/MessagesApi.md#create_message) | **POST** /users/{accountId}/messages | Create Message
*Bandwidth::MessagesApi* | [**list_messages**](docs/MessagesApi.md#list_messages) | **GET** /users/{accountId}/messages | List Messages
*Bandwidth::PhoneNumberLookupApi* | [**create_lookup**](docs/PhoneNumberLookupApi.md#create_lookup) | **POST** /accounts/{accountId}/tnlookup | Create Lookup
*Bandwidth::PhoneNumberLookupApi* | [**get_lookup_status**](docs/PhoneNumberLookupApi.md#get_lookup_status) | **GET** /accounts/{accountId}/tnlookup/{requestId} | Get Lookup Request Status
*Bandwidth::RecordingsApi* | [**delete_recording**](docs/RecordingsApi.md#delete_recording) | **DELETE** /accounts/{accountId}/calls/{callId}/recordings/{recordingId} | Delete Recording
*Bandwidth::RecordingsApi* | [**delete_recording_media**](docs/RecordingsApi.md#delete_recording_media) | **DELETE** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/media | Delete Recording Media
*Bandwidth::RecordingsApi* | [**delete_recording_transcription**](docs/RecordingsApi.md#delete_recording_transcription) | **DELETE** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/transcription | Delete Transcription
*Bandwidth::RecordingsApi* | [**download_call_recording**](docs/RecordingsApi.md#download_call_recording) | **GET** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/media | Download Recording
*Bandwidth::RecordingsApi* | [**get_call_recording**](docs/RecordingsApi.md#get_call_recording) | **GET** /accounts/{accountId}/calls/{callId}/recordings/{recordingId} | Get Call Recording
*Bandwidth::RecordingsApi* | [**get_recording_transcription**](docs/RecordingsApi.md#get_recording_transcription) | **GET** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/transcription | Get Transcription
*Bandwidth::RecordingsApi* | [**list_account_call_recordings**](docs/RecordingsApi.md#list_account_call_recordings) | **GET** /accounts/{accountId}/recordings | Get Call Recordings
*Bandwidth::RecordingsApi* | [**list_call_recordings**](docs/RecordingsApi.md#list_call_recordings) | **GET** /accounts/{accountId}/calls/{callId}/recordings | List Call Recordings
*Bandwidth::RecordingsApi* | [**transcribe_call_recording**](docs/RecordingsApi.md#transcribe_call_recording) | **POST** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/transcription | Create Transcription Request
*Bandwidth::RecordingsApi* | [**update_call_recording_state**](docs/RecordingsApi.md#update_call_recording_state) | **PUT** /accounts/{accountId}/calls/{callId}/recording | Update Recording
*Bandwidth::StatisticsApi* | [**get_statistics**](docs/StatisticsApi.md#get_statistics) | **GET** /accounts/{accountId}/statistics | Get Account Statistics
*Bandwidth::TranscriptionsApi* | [**delete_real_time_transcription**](docs/TranscriptionsApi.md#delete_real_time_transcription) | **DELETE** /accounts/{accountId}/calls/{callId}/transcriptions/{transcriptionId} | Delete a specific transcription
*Bandwidth::TranscriptionsApi* | [**get_real_time_transcription**](docs/TranscriptionsApi.md#get_real_time_transcription) | **GET** /accounts/{accountId}/calls/{callId}/transcriptions/{transcriptionId} | Retrieve a specific transcription
*Bandwidth::TranscriptionsApi* | [**list_real_time_transcriptions**](docs/TranscriptionsApi.md#list_real_time_transcriptions) | **GET** /accounts/{accountId}/calls/{callId}/transcriptions | Enumerate transcriptions made with StartTranscription


## Documentation for Models

 - [Bandwidth::AccountStatistics](docs/AccountStatistics.md)
 - [Bandwidth::AnswerCallback](docs/AnswerCallback.md)
 - [Bandwidth::BridgeCompleteCallback](docs/BridgeCompleteCallback.md)
 - [Bandwidth::BridgeTargetCompleteCallback](docs/BridgeTargetCompleteCallback.md)
 - [Bandwidth::CallDirectionEnum](docs/CallDirectionEnum.md)
 - [Bandwidth::CallRecordingMetadata](docs/CallRecordingMetadata.md)
 - [Bandwidth::CallState](docs/CallState.md)
 - [Bandwidth::CallStateEnum](docs/CallStateEnum.md)
 - [Bandwidth::CallTranscription](docs/CallTranscription.md)
 - [Bandwidth::CallTranscriptionDetectedLanguageEnum](docs/CallTranscriptionDetectedLanguageEnum.md)
 - [Bandwidth::CallTranscriptionMetadata](docs/CallTranscriptionMetadata.md)
 - [Bandwidth::CallTranscriptionResponse](docs/CallTranscriptionResponse.md)
 - [Bandwidth::CallTranscriptionTrackEnum](docs/CallTranscriptionTrackEnum.md)
 - [Bandwidth::CallbackMethodEnum](docs/CallbackMethodEnum.md)
 - [Bandwidth::CodeRequest](docs/CodeRequest.md)
 - [Bandwidth::Conference](docs/Conference.md)
 - [Bandwidth::ConferenceCompletedCallback](docs/ConferenceCompletedCallback.md)
 - [Bandwidth::ConferenceCreatedCallback](docs/ConferenceCreatedCallback.md)
 - [Bandwidth::ConferenceMember](docs/ConferenceMember.md)
 - [Bandwidth::ConferenceMemberExitCallback](docs/ConferenceMemberExitCallback.md)
 - [Bandwidth::ConferenceMemberJoinCallback](docs/ConferenceMemberJoinCallback.md)
 - [Bandwidth::ConferenceRecordingAvailableCallback](docs/ConferenceRecordingAvailableCallback.md)
 - [Bandwidth::ConferenceRecordingMetadata](docs/ConferenceRecordingMetadata.md)
 - [Bandwidth::ConferenceRedirectCallback](docs/ConferenceRedirectCallback.md)
 - [Bandwidth::ConferenceStateEnum](docs/ConferenceStateEnum.md)
 - [Bandwidth::CreateCall](docs/CreateCall.md)
 - [Bandwidth::CreateCallResponse](docs/CreateCallResponse.md)
 - [Bandwidth::CreateLookupResponse](docs/CreateLookupResponse.md)
 - [Bandwidth::CreateMessageRequestError](docs/CreateMessageRequestError.md)
 - [Bandwidth::DeferredResult](docs/DeferredResult.md)
 - [Bandwidth::DisconnectCallback](docs/DisconnectCallback.md)
 - [Bandwidth::Diversion](docs/Diversion.md)
 - [Bandwidth::DtmfCallback](docs/DtmfCallback.md)
 - [Bandwidth::FieldError](docs/FieldError.md)
 - [Bandwidth::FileFormatEnum](docs/FileFormatEnum.md)
 - [Bandwidth::GatherCallback](docs/GatherCallback.md)
 - [Bandwidth::InboundMessageCallback](docs/InboundMessageCallback.md)
 - [Bandwidth::InboundMessageCallbackMessage](docs/InboundMessageCallbackMessage.md)
 - [Bandwidth::InitiateCallback](docs/InitiateCallback.md)
 - [Bandwidth::ListMessageDirectionEnum](docs/ListMessageDirectionEnum.md)
 - [Bandwidth::ListMessageItem](docs/ListMessageItem.md)
 - [Bandwidth::LookupRequest](docs/LookupRequest.md)
 - [Bandwidth::LookupResult](docs/LookupResult.md)
 - [Bandwidth::LookupStatus](docs/LookupStatus.md)
 - [Bandwidth::LookupStatusEnum](docs/LookupStatusEnum.md)
 - [Bandwidth::MachineDetectionCompleteCallback](docs/MachineDetectionCompleteCallback.md)
 - [Bandwidth::MachineDetectionConfiguration](docs/MachineDetectionConfiguration.md)
 - [Bandwidth::MachineDetectionModeEnum](docs/MachineDetectionModeEnum.md)
 - [Bandwidth::MachineDetectionResult](docs/MachineDetectionResult.md)
 - [Bandwidth::Media](docs/Media.md)
 - [Bandwidth::Message](docs/Message.md)
 - [Bandwidth::MessageDeliveredCallback](docs/MessageDeliveredCallback.md)
 - [Bandwidth::MessageDeliveredCallbackMessage](docs/MessageDeliveredCallbackMessage.md)
 - [Bandwidth::MessageDirectionEnum](docs/MessageDirectionEnum.md)
 - [Bandwidth::MessageFailedCallback](docs/MessageFailedCallback.md)
 - [Bandwidth::MessageFailedCallbackMessage](docs/MessageFailedCallbackMessage.md)
 - [Bandwidth::MessageRequest](docs/MessageRequest.md)
 - [Bandwidth::MessageSendingCallback](docs/MessageSendingCallback.md)
 - [Bandwidth::MessageSendingCallbackMessage](docs/MessageSendingCallbackMessage.md)
 - [Bandwidth::MessageStatusEnum](docs/MessageStatusEnum.md)
 - [Bandwidth::MessageTypeEnum](docs/MessageTypeEnum.md)
 - [Bandwidth::MessagesList](docs/MessagesList.md)
 - [Bandwidth::MessagingCodeResponse](docs/MessagingCodeResponse.md)
 - [Bandwidth::MessagingRequestError](docs/MessagingRequestError.md)
 - [Bandwidth::MfaForbiddenRequestError](docs/MfaForbiddenRequestError.md)
 - [Bandwidth::MfaRequestError](docs/MfaRequestError.md)
 - [Bandwidth::MfaUnauthorizedRequestError](docs/MfaUnauthorizedRequestError.md)
 - [Bandwidth::PageInfo](docs/PageInfo.md)
 - [Bandwidth::PriorityEnum](docs/PriorityEnum.md)
 - [Bandwidth::RecordingAvailableCallback](docs/RecordingAvailableCallback.md)
 - [Bandwidth::RecordingCompleteCallback](docs/RecordingCompleteCallback.md)
 - [Bandwidth::RecordingStateEnum](docs/RecordingStateEnum.md)
 - [Bandwidth::RecordingTranscriptionMetadata](docs/RecordingTranscriptionMetadata.md)
 - [Bandwidth::RecordingTranscriptions](docs/RecordingTranscriptions.md)
 - [Bandwidth::RedirectCallback](docs/RedirectCallback.md)
 - [Bandwidth::RedirectMethodEnum](docs/RedirectMethodEnum.md)
 - [Bandwidth::StirShaken](docs/StirShaken.md)
 - [Bandwidth::Tag](docs/Tag.md)
 - [Bandwidth::TnLookupRequestError](docs/TnLookupRequestError.md)
 - [Bandwidth::TranscribeRecording](docs/TranscribeRecording.md)
 - [Bandwidth::Transcription](docs/Transcription.md)
 - [Bandwidth::TranscriptionAvailableCallback](docs/TranscriptionAvailableCallback.md)
 - [Bandwidth::TransferAnswerCallback](docs/TransferAnswerCallback.md)
 - [Bandwidth::TransferCompleteCallback](docs/TransferCompleteCallback.md)
 - [Bandwidth::TransferDisconnectCallback](docs/TransferDisconnectCallback.md)
 - [Bandwidth::UpdateCall](docs/UpdateCall.md)
 - [Bandwidth::UpdateCallRecording](docs/UpdateCallRecording.md)
 - [Bandwidth::UpdateConference](docs/UpdateConference.md)
 - [Bandwidth::UpdateConferenceMember](docs/UpdateConferenceMember.md)
 - [Bandwidth::VerifyCodeRequest](docs/VerifyCodeRequest.md)
 - [Bandwidth::VerifyCodeResponse](docs/VerifyCodeResponse.md)
 - [Bandwidth::VoiceApiError](docs/VoiceApiError.md)
 - [Bandwidth::VoiceCodeResponse](docs/VoiceCodeResponse.md)


## Documentation for Authorization


Authentication schemes defined for the API:
### Basic

- **Type**: HTTP basic authentication

