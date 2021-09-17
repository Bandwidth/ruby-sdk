# API

```ruby
client_controller = client.voice_client.client
```

## Class Name

`APIController`

## Methods

* [Create Call](/doc/Voice/controllers/api.md#create-call)
* [Get Call](/doc/Voice/controllers/api.md#get-call)
* [Modify Call](/doc/Voice/controllers/api.md#modify-call)
* [Modify Call Recording State](/doc/Voice/controllers/api.md#modify-call-recording-state)
* [Get Call Recordings](/doc/Voice/controllers/api.md#get-call-recordings)
* [Get Call Recording](/doc/Voice/controllers/api.md#get-call-recording)
* [Delete Recording](/doc/Voice/controllers/api.md#delete-recording)
* [Get Download Call Recording](/doc/Voice/controllers/api.md#get-download-call-recording)
* [Delete Recording Media](/doc/Voice/controllers/api.md#delete-recording-media)
* [Get Call Transcription](/doc/Voice/controllers/api.md#get-call-transcription)
* [Create Transcribe Call Recording](/doc/Voice/controllers/api.md#create-transcribe-call-recording)
* [Delete Call Transcription](/doc/Voice/controllers/api.md#delete-call-transcription)
* [Get Conferences](/doc/Voice/controllers/api.md#get-conferences)
* [Get Conference](/doc/Voice/controllers/api.md#get-conference)
* [Modify Conference](/doc/Voice/controllers/api.md#modify-conference)
* [Modify Conference Member](/doc/Voice/controllers/api.md#modify-conference-member)
* [Get Conference Member](/doc/Voice/controllers/api.md#get-conference-member)
* [Get Conference Recordings](/doc/Voice/controllers/api.md#get-conference-recordings)
* [Get Conference Recording](/doc/Voice/controllers/api.md#get-conference-recording)
* [Get Download Conference Recording](/doc/Voice/controllers/api.md#get-download-conference-recording)
* [Get Query Call Recordings](/doc/Voice/controllers/api.md#get-query-call-recordings)


# Create Call

Creates an outbound phone call.

```ruby
def create_call(account_id,
                body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `body` | [`CreateCallRequest`]($m/Voice/CreateCallRequest) | Body, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`CreateCallResponse`]($m/Voice/CreateCallResponse)

## Example Usage

```ruby
account_id = 'accountId0'
body = CreateCallRequest.new
body.from = '+15555555555'
body.to = '+15555555555, sip:john@doe.com'
body.answer_url = 'answerUrl4'
body.application_id = 'applicationId6'

result = client_controller.create_call(account_id, body)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Call

Returns near-realtime metadata about the specified call.

```ruby
def get_call(account_id,
             call_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`CallState`]($m/Voice/CallState)

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'

result = client_controller.get_call(account_id, call_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Modify Call

Interrupts and replaces an active call's BXML document.

```ruby
def modify_call(account_id,
                call_id,
                body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `body` | [`ModifyCallRequest`]($m/Voice/ModifyCallRequest) | Body, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'
body = ModifyCallRequest.new

result = client_controller.modify_call(account_id, call_id, body)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Modify Call Recording State

Pauses or resumes a recording.

```ruby
def modify_call_recording_state(account_id,
                                call_id,
                                body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `body` | [`ModifyCallRecordingRequest`]($m/Voice/ModifyCallRecordingRequest) | Body, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'
body = ModifyCallRecordingRequest.new
body.state = State1Enum::PAUSED

result = client_controller.modify_call_recording_state(account_id, call_id, body)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Call Recordings

Returns a (potentially empty) list of metadata for the recordings that took place during the specified call.

```ruby
def get_call_recordings(account_id,
                        call_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`Array<CallRecordingMetadata>`]($m/Voice/CallRecordingMetadata)

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'

result = client_controller.get_call_recordings(account_id, call_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Call Recording

Returns metadata for the specified recording.

```ruby
def get_call_recording(account_id,
                       call_id,
                       recording_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `recording_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`CallRecordingMetadata`]($m/Voice/CallRecordingMetadata)

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'
recording_id = 'recordingId2'

result = client_controller.get_call_recording(account_id, call_id, recording_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Delete Recording

Deletes the specified recording.

```ruby
def delete_recording(account_id,
                     call_id,
                     recording_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `recording_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'
recording_id = 'recordingId2'

result = client_controller.delete_recording(account_id, call_id, recording_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Download Call Recording

Downloads the specified recording.

```ruby
def get_download_call_recording(account_id,
                                call_id,
                                recording_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `recording_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`Mixed`

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'
recording_id = 'recordingId2'

result = client_controller.get_download_call_recording(account_id, call_id, recording_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Delete Recording Media

Deletes the specified recording's media.

```ruby
def delete_recording_media(account_id,
                           call_id,
                           recording_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `recording_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'
recording_id = 'recordingId2'

result = client_controller.delete_recording_media(account_id, call_id, recording_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Call Transcription

Downloads the specified transcription.

```ruby
def get_call_transcription(account_id,
                           call_id,
                           recording_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `recording_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`TranscriptionResponse`]($m/Voice/TranscriptionResponse)

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'
recording_id = 'recordingId2'

result = client_controller.get_call_transcription(account_id, call_id, recording_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Create Transcribe Call Recording

Requests that the specified recording be transcribed.

```ruby
def create_transcribe_call_recording(account_id,
                                     call_id,
                                     recording_id,
                                     body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `recording_id` | `String` | Template, Required | - |
| `body` | [`TranscribeRecordingRequest`]($m/Voice/TranscribeRecordingRequest) | Body, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'
recording_id = 'recordingId2'
body = TranscribeRecordingRequest.new

result = client_controller.create_transcribe_call_recording(account_id, call_id, recording_id, body)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 410 | The media for this recording has been deleted, so we can't transcribe it | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Delete Call Transcription

Deletes the specified recording's transcription.

```ruby
def delete_call_transcription(account_id,
                              call_id,
                              recording_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `recording_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
call_id = 'callId0'
recording_id = 'recordingId2'

result = client_controller.delete_call_transcription(account_id, call_id, recording_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Conferences

Returns information about the conferences in the account.

```ruby
def get_conferences(account_id,
                    name: nil,
                    min_created_time: nil,
                    max_created_time: nil,
                    page_size: 1000,
                    page_token: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `name` | `String` | Query, Optional | - |
| `min_created_time` | `String` | Query, Optional | - |
| `max_created_time` | `String` | Query, Optional | - |
| `page_size` | `Integer` | Query, Optional | **Default**: `1000` |
| `page_token` | `String` | Query, Optional | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`Array<ConferenceState>`]($m/Voice/ConferenceState)

## Example Usage

```ruby
account_id = 'accountId0'
page_size = 1000

result = client_controller.get_conferences(account_id, page_size: page_size, )
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Conference

Returns information about the specified conference.

```ruby
def get_conference(account_id,
                   conference_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `conference_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`ConferenceState`]($m/Voice/ConferenceState)

## Example Usage

```ruby
account_id = 'accountId0'
conference_id = 'conferenceId0'

result = client_controller.get_conference(account_id, conference_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Modify Conference

Modify the conference state.

```ruby
def modify_conference(account_id,
                      conference_id,
                      body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `conference_id` | `String` | Template, Required | - |
| `body` | [`ModifyConferenceRequest`]($m/Voice/ModifyConferenceRequest) | Body, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
conference_id = 'conferenceId0'
body = ModifyConferenceRequest.new

result = client_controller.modify_conference(account_id, conference_id, body)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Modify Conference Member

Updates settings for a particular conference member.

```ruby
def modify_conference_member(account_id,
                             conference_id,
                             call_id,
                             body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `conference_id` | `String` | Template, Required | - |
| `call_id` | `String` | Template, Required | - |
| `body` | [`ConferenceMemberState`]($m/Voice/ConferenceMemberState) | Body, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
conference_id = 'conferenceId0'
call_id = 'callId0'
body = ConferenceMemberState.new

result = client_controller.modify_conference_member(account_id, conference_id, call_id, body)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Conference Member

Returns information about the specified conference member.

```ruby
def get_conference_member(account_id,
                          conference_id,
                          member_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `conference_id` | `String` | Template, Required | - |
| `member_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`ConferenceMemberState`]($m/Voice/ConferenceMemberState)

## Example Usage

```ruby
account_id = 'accountId0'
conference_id = 'conferenceId0'
member_id = 'memberId0'

result = client_controller.get_conference_member(account_id, conference_id, member_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Conference Recordings

Returns a (potentially empty) list of metadata for the recordings that took place during the specified conference

```ruby
def get_conference_recordings(account_id,
                              conference_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `conference_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`Array<ConferenceRecordingMetadata>`]($m/Voice/ConferenceRecordingMetadata)

## Example Usage

```ruby
account_id = 'accountId0'
conference_id = 'conferenceId0'

result = client_controller.get_conference_recordings(account_id, conference_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Conference Recording

Returns metadata for the specified recording.

```ruby
def get_conference_recording(account_id,
                             conference_id,
                             recording_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `conference_id` | `String` | Template, Required | - |
| `recording_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`CallRecordingMetadata`]($m/Voice/CallRecordingMetadata)

## Example Usage

```ruby
account_id = 'accountId0'
conference_id = 'conferenceId0'
recording_id = 'recordingId2'

result = client_controller.get_conference_recording(account_id, conference_id, recording_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Download Conference Recording

Downloads the specified recording.

```ruby
def get_download_conference_recording(account_id,
                                      conference_id,
                                      recording_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `conference_id` | `String` | Template, Required | - |
| `recording_id` | `String` | Template, Required | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

`Mixed`

## Example Usage

```ruby
account_id = 'accountId0'
conference_id = 'conferenceId0'
recording_id = 'recordingId2'

result = client_controller.get_download_conference_recording(account_id, conference_id, recording_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |


# Get Query Call Recordings

Returns a list of metadata for the recordings associated with the specified account. The list can be filtered by the optional from, to, minStartTime, and maxStartTime arguments. The list is capped at 1000 entries and may be empty if no recordings match the specified criteria.

```ruby
def get_query_call_recordings(account_id,
                              from: nil,
                              to: nil,
                              min_start_time: nil,
                              max_start_time: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | - |
| `from` | `String` | Query, Optional | - |
| `to` | `String` | Query, Optional | - |
| `min_start_time` | `String` | Query, Optional | - |
| `max_start_time` | `String` | Query, Optional | - |

## Server

`Server::VOICEDEFAULT`

## Response Type

[`Array<CallRecordingMetadata>`]($m/Voice/CallRecordingMetadata)

## Example Usage

```ruby
account_id = 'accountId0'

result = client_controller.get_query_call_recordings(account_id, )
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Something's not quite right... Your request is invalid. Please fix it before trying again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 401 | Your credentials are invalid. Please use your Bandwidth dashboard credentials to authenticate to the API. | `APIException` |
| 403 | User unauthorized to perform this action. | [`ApiErrorException`]($m/Voice/ApiError) |
| 404 | The resource specified cannot be found or does not belong to you. | [`ApiErrorException`]($m/Voice/ApiError) |
| 415 | We don't support that media type. If a request body is required, please send it to us as `application/json`. | [`ApiErrorException`]($m/Voice/ApiError) |
| 429 | You're sending requests to this endpoint too frequently. Please slow your request rate down and try again. | [`ApiErrorException`]($m/Voice/ApiError) |
| 500 | Something unexpected happened. Please try again. | [`ApiErrorException`]($m/Voice/ApiError) |

