# API

```ruby
client_controller = client.web_rtc_client.client
```

## Class Name

`APIController`

## Methods

* [Create Participant](/doc/WebRtc/controllers/api.md#create-participant)
* [Get Participant](/doc/WebRtc/controllers/api.md#get-participant)
* [Delete Participant](/doc/WebRtc/controllers/api.md#delete-participant)
* [Create Session](/doc/WebRtc/controllers/api.md#create-session)
* [Get Session](/doc/WebRtc/controllers/api.md#get-session)
* [Delete Session](/doc/WebRtc/controllers/api.md#delete-session)
* [List Session Participants](/doc/WebRtc/controllers/api.md#list-session-participants)
* [Add Participant to Session](/doc/WebRtc/controllers/api.md#add-participant-to-session)
* [Remove Participant From Session](/doc/WebRtc/controllers/api.md#remove-participant-from-session)
* [Get Participant Subscriptions](/doc/WebRtc/controllers/api.md#get-participant-subscriptions)
* [Update Participant Subscriptions](/doc/WebRtc/controllers/api.md#update-participant-subscriptions)


# Create Participant

Create a new participant under this account.

Participants are idempotent, so relevant parameters must be set in this function if desired.

```ruby
def create_participant(account_id,
                       body: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `body` | [`Participant`]($m/WebRtc/Participant) | Body, Optional | Participant parameters |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

[`AccountsParticipantsResponse`]($m/WebRtc/Accounts%20Participants%20Response)

## Example Usage

```ruby
account_id = 'accountId0'

result = client_controller.create_participant(account_id, )
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Bad Request | `APIException` |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# Get Participant

Get participant by ID.

```ruby
def get_participant(account_id,
                    participant_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `participant_id` | `String` | Template, Required | Participant ID |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

[`Participant`]($m/WebRtc/Participant)

## Example Usage

```ruby
account_id = 'accountId0'
participant_id = 'participantId0'

result = client_controller.get_participant(account_id, participant_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| 404 | Not Found | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# Delete Participant

Delete participant by ID.

```ruby
def delete_participant(account_id,
                       participant_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `participant_id` | `String` | Template, Required | - |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
participant_id = 'participantId0'

result = client_controller.delete_participant(account_id, participant_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| 404 | Not Found | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# Create Session

Create a new session.

Sessions are idempotent, so relevant parameters must be set in this function if desired.

```ruby
def create_session(account_id,
                   body: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `body` | [`Session`]($m/WebRtc/Session) | Body, Optional | Session parameters |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

[`Session`]($m/WebRtc/Session)

## Example Usage

```ruby
account_id = 'accountId0'

result = client_controller.create_session(account_id, )
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Bad Request | `APIException` |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# Get Session

Get session by ID.

```ruby
def get_session(account_id,
                session_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `session_id` | `String` | Template, Required | Session ID |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

[`Session`]($m/WebRtc/Session)

## Example Usage

```ruby
account_id = 'accountId0'
session_id = 'sessionId8'

result = client_controller.get_session(account_id, session_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| 404 | Not Found | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# Delete Session

Delete session by ID.

```ruby
def delete_session(account_id,
                   session_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `session_id` | `String` | Template, Required | Session ID |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
session_id = 'sessionId8'

result = client_controller.delete_session(account_id, session_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| 404 | Not Found | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# List Session Participants

List participants in a session.

```ruby
def list_session_participants(account_id,
                              session_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `session_id` | `String` | Template, Required | Session ID |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

[`Array<Participant>`]($m/WebRtc/Participant)

## Example Usage

```ruby
account_id = 'accountId0'
session_id = 'sessionId8'

result = client_controller.list_session_participants(account_id, session_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| 404 | Not Found | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# Add Participant to Session

Add a participant to a session.

Subscriptions can optionally be provided as part of this call.

```ruby
def add_participant_to_session(account_id,
                               session_id,
                               participant_id,
                               body: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `session_id` | `String` | Template, Required | Session ID |
| `participant_id` | `String` | Template, Required | Participant ID |
| `body` | [`Subscriptions`]($m/WebRtc/Subscriptions) | Body, Optional | Subscriptions the participant should be created with |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
session_id = 'sessionId8'
participant_id = 'participantId0'
body = Subscriptions.new
body.session_id = 'd8886aad-b956-4e1b-b2f4-d7c9f8162772'

result = client_controller.add_participant_to_session(account_id, session_id, participant_id, body: body)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| 404 | Not Found | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# Remove Participant From Session

Remove a participant from a session.

This will automatically remove any subscriptions the participant has associated with this session.

```ruby
def remove_participant_from_session(account_id,
                                    session_id,
                                    participant_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `session_id` | `String` | Template, Required | Session ID |
| `participant_id` | `String` | Template, Required | Participant ID |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
session_id = 'sessionId8'
participant_id = 'participantId0'

result = client_controller.remove_participant_from_session(account_id, session_id, participant_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| 404 | Not Found | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# Get Participant Subscriptions

Get a participant's subscriptions.

```ruby
def get_participant_subscriptions(account_id,
                                  session_id,
                                  participant_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `session_id` | `String` | Template, Required | Session ID |
| `participant_id` | `String` | Template, Required | Participant ID |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

[`Subscriptions`]($m/WebRtc/Subscriptions)

## Example Usage

```ruby
account_id = 'accountId0'
session_id = 'sessionId8'
participant_id = 'participantId0'

result = client_controller.get_participant_subscriptions(account_id, session_id, participant_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| 404 | Not Found | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |


# Update Participant Subscriptions

Update a participant's subscriptions.

This is a full update that will replace the participant's subscriptions. First call `getParticipantSubscriptions` if you need the current subscriptions. Call this function with no `Subscriptions` object to remove all subscriptions.

```ruby
def update_participant_subscriptions(account_id,
                                     session_id,
                                     participant_id,
                                     body: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | Account ID |
| `session_id` | `String` | Template, Required | Session ID |
| `participant_id` | `String` | Template, Required | Participant ID |
| `body` | [`Subscriptions`]($m/WebRtc/Subscriptions) | Body, Optional | Initial state |

## Server

`Server::WEBRTCDEFAULT`

## Response Type

`void`

## Example Usage

```ruby
account_id = 'accountId0'
session_id = 'sessionId8'
participant_id = 'participantId0'
body = Subscriptions.new
body.session_id = 'd8886aad-b956-4e1b-b2f4-d7c9f8162772'

result = client_controller.update_participant_subscriptions(account_id, session_id, participant_id, body: body)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Bad Request | `APIException` |
| 401 | Unauthorized | `APIException` |
| 403 | Access Denied | `APIException` |
| 404 | Not Found | `APIException` |
| Default | Unexpected Error | [`ErrorException`]($m/WebRtc/Error) |
