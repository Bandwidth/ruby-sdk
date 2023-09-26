# Bandwidth::SessionsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_participant_to_session**](SessionsApi.md#add_participant_to_session) | **PUT** /accounts/{accountId}/sessions/{sessionId}/participants/{participantId} | Add Participant to Session |
| [**create_session**](SessionsApi.md#create_session) | **POST** /accounts/{accountId}/sessions | Create Session |
| [**delete_session**](SessionsApi.md#delete_session) | **DELETE** /accounts/{accountId}/sessions/{sessionId} | Delete Session |
| [**get_participant_subscriptions**](SessionsApi.md#get_participant_subscriptions) | **GET** /accounts/{accountId}/sessions/{sessionId}/participants/{participantId}/subscriptions | Get Participant Subscriptions |
| [**get_session**](SessionsApi.md#get_session) | **GET** /accounts/{accountId}/sessions/{sessionId} | Get Session |
| [**list_session_participants**](SessionsApi.md#list_session_participants) | **GET** /accounts/{accountId}/sessions/{sessionId}/participants | List Participants in Session |
| [**remove_participant_from_session**](SessionsApi.md#remove_participant_from_session) | **DELETE** /accounts/{accountId}/sessions/{sessionId}/participants/{participantId} | Remove Participant from Session |
| [**update_participant_subscriptions**](SessionsApi.md#update_participant_subscriptions) | **PUT** /accounts/{accountId}/sessions/{sessionId}/participants/{participantId}/subscriptions | Update Participant Subscriptions |


## add_participant_to_session

> add_participant_to_session(account_id, session_id, participant_id, opts)

Add Participant to Session

Add a participant to a session.  Subscriptions can optionally be provided as part of this call. 

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::SessionsApi.new
account_id = '9900000' # String | Account ID
session_id = 'cb5054ee-a69b-41ac-9ab2-04d6370826b4' # String | Session ID
participant_id = '62e0ecb9-0b1b-5115-aae4-4f36123d6bb1' # String | Participant ID
opts = {
  subscriptions: Bandwidth::Subscriptions.new # Subscriptions | The Body describes an optional set of subscriptions to apply to the participant.  Calling this endpoint with no/empty body will only add the participant to the session, and will not subscribe the Participant to any media.  The request body for this endpoint is OPTIONAL and provided as a convenience to avoid additional calls to the Update Participant Subscriptions endpoint. --- If a body is provided it will result in direct control over what Participants are subscribed to.    - if the participants Array is provided and not empty, that list of Participants will be subscribed To   - if the participants Array is missing or empty, and the sessionId is provided, the participant will be subscribed to the session, including all subsequent changes to the membership of the session   - if the sessionId and the participant Array are both missing or empty, no subscriptions will be created
}

begin
  # Add Participant to Session
  api_instance.add_participant_to_session(account_id, session_id, participant_id, opts)
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->add_participant_to_session: #{e}"
end
```

#### Using the add_participant_to_session_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> add_participant_to_session_with_http_info(account_id, session_id, participant_id, opts)

```ruby
begin
  # Add Participant to Session
  data, status_code, headers = api_instance.add_participant_to_session_with_http_info(account_id, session_id, participant_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->add_participant_to_session_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Account ID |  |
| **session_id** | **String** | Session ID |  |
| **participant_id** | **String** | Participant ID |  |
| **subscriptions** | [**Subscriptions**](Subscriptions.md) | The Body describes an optional set of subscriptions to apply to the participant.  Calling this endpoint with no/empty body will only add the participant to the session, and will not subscribe the Participant to any media.  The request body for this endpoint is OPTIONAL and provided as a convenience to avoid additional calls to the Update Participant Subscriptions endpoint. --- If a body is provided it will result in direct control over what Participants are subscribed to.    - if the participants Array is provided and not empty, that list of Participants will be subscribed To   - if the participants Array is missing or empty, and the sessionId is provided, the participant will be subscribed to the session, including all subsequent changes to the membership of the session   - if the sessionId and the participant Array are both missing or empty, no subscriptions will be created | [optional] |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_session

> <Session> create_session(account_id, opts)

Create Session

Create a new session. Sessions are idempotent, so relevant parameters must be set in this function if desired.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::SessionsApi.new
account_id = '9900000' # String | Account ID
opts = {
  session: Bandwidth::Session.new # Session | Create session request body.
}

begin
  # Create Session
  result = api_instance.create_session(account_id, opts)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->create_session: #{e}"
end
```

#### Using the create_session_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Session>, Integer, Hash)> create_session_with_http_info(account_id, opts)

```ruby
begin
  # Create Session
  data, status_code, headers = api_instance.create_session_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Session>
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->create_session_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Account ID |  |
| **session** | [**Session**](Session.md) | Create session request body. | [optional] |

### Return type

[**Session**](Session.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_session

> delete_session(account_id, session_id)

Delete Session

Delete session by ID.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::SessionsApi.new
account_id = '9900000' # String | Account ID
session_id = 'cb5054ee-a69b-41ac-9ab2-04d6370826b4' # String | Session ID

begin
  # Delete Session
  api_instance.delete_session(account_id, session_id)
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->delete_session: #{e}"
end
```

#### Using the delete_session_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_session_with_http_info(account_id, session_id)

```ruby
begin
  # Delete Session
  data, status_code, headers = api_instance.delete_session_with_http_info(account_id, session_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->delete_session_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Account ID |  |
| **session_id** | **String** | Session ID |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_participant_subscriptions

> <Subscriptions> get_participant_subscriptions(account_id, session_id, participant_id)

Get Participant Subscriptions

Get a participant's subscriptions.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::SessionsApi.new
account_id = '9900000' # String | Account ID
session_id = 'cb5054ee-a69b-41ac-9ab2-04d6370826b4' # String | Session ID
participant_id = '62e0ecb9-0b1b-5115-aae4-4f36123d6bb1' # String | Participant ID

begin
  # Get Participant Subscriptions
  result = api_instance.get_participant_subscriptions(account_id, session_id, participant_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->get_participant_subscriptions: #{e}"
end
```

#### Using the get_participant_subscriptions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Subscriptions>, Integer, Hash)> get_participant_subscriptions_with_http_info(account_id, session_id, participant_id)

```ruby
begin
  # Get Participant Subscriptions
  data, status_code, headers = api_instance.get_participant_subscriptions_with_http_info(account_id, session_id, participant_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Subscriptions>
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->get_participant_subscriptions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Account ID |  |
| **session_id** | **String** | Session ID |  |
| **participant_id** | **String** | Participant ID |  |

### Return type

[**Subscriptions**](Subscriptions.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_session

> <Session> get_session(account_id, session_id)

Get Session

Get session by ID.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::SessionsApi.new
account_id = '9900000' # String | Account ID
session_id = 'cb5054ee-a69b-41ac-9ab2-04d6370826b4' # String | Session ID

begin
  # Get Session
  result = api_instance.get_session(account_id, session_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->get_session: #{e}"
end
```

#### Using the get_session_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Session>, Integer, Hash)> get_session_with_http_info(account_id, session_id)

```ruby
begin
  # Get Session
  data, status_code, headers = api_instance.get_session_with_http_info(account_id, session_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Session>
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->get_session_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Account ID |  |
| **session_id** | **String** | Session ID |  |

### Return type

[**Session**](Session.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_session_participants

> <Array<Participant>> list_session_participants(account_id, session_id)

List Participants in Session

List participants in a session.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::SessionsApi.new
account_id = '9900000' # String | Account ID
session_id = 'cb5054ee-a69b-41ac-9ab2-04d6370826b4' # String | Session ID

begin
  # List Participants in Session
  result = api_instance.list_session_participants(account_id, session_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->list_session_participants: #{e}"
end
```

#### Using the list_session_participants_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Participant>>, Integer, Hash)> list_session_participants_with_http_info(account_id, session_id)

```ruby
begin
  # List Participants in Session
  data, status_code, headers = api_instance.list_session_participants_with_http_info(account_id, session_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Participant>>
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->list_session_participants_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Account ID |  |
| **session_id** | **String** | Session ID |  |

### Return type

[**Array&lt;Participant&gt;**](Participant.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## remove_participant_from_session

> remove_participant_from_session(account_id, session_id, participant_id)

Remove Participant from Session

Remove a participant from a session. This will automatically remove any subscriptions the participant has associated with this session.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::SessionsApi.new
account_id = '9900000' # String | Account ID
session_id = 'cb5054ee-a69b-41ac-9ab2-04d6370826b4' # String | Session ID
participant_id = '62e0ecb9-0b1b-5115-aae4-4f36123d6bb1' # String | Participant ID

begin
  # Remove Participant from Session
  api_instance.remove_participant_from_session(account_id, session_id, participant_id)
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->remove_participant_from_session: #{e}"
end
```

#### Using the remove_participant_from_session_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> remove_participant_from_session_with_http_info(account_id, session_id, participant_id)

```ruby
begin
  # Remove Participant from Session
  data, status_code, headers = api_instance.remove_participant_from_session_with_http_info(account_id, session_id, participant_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->remove_participant_from_session_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Account ID |  |
| **session_id** | **String** | Session ID |  |
| **participant_id** | **String** | Participant ID |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_participant_subscriptions

> update_participant_subscriptions(account_id, session_id, participant_id, opts)

Update Participant Subscriptions

Update a participant's subscriptions. This is a full update that will replace the participant's subscriptions. It allows subscription to the entire Session, a subset list of Participants in that Session, or specific media streams on any of the listed Participants. First call `getParticipantSubscriptions` if you need the current subscriptions. Calling this API with no `Subscriptions` object to remove all subscriptions.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::SessionsApi.new
account_id = '9900000' # String | Account ID
session_id = 'cb5054ee-a69b-41ac-9ab2-04d6370826b4' # String | Session ID
participant_id = '62e0ecb9-0b1b-5115-aae4-4f36123d6bb1' # String | Participant ID
opts = {
  subscriptions: Bandwidth::Subscriptions.new # Subscriptions | The body describes the desired subscriptions for the Participant. --- If a body is provided it will result in direct control over what Participants are subscribed to.    - if the participants Array is provided and not empty, that list of Participants will be subscribed To   - if the participants Array is missing or empty, and the sessionId is provided, the participant will be subscribed to the session, including all subsequent changes to the membership of the session   - if the sessionId and the participant Array are both missing or empty, no subscriptions will be created
}

begin
  # Update Participant Subscriptions
  api_instance.update_participant_subscriptions(account_id, session_id, participant_id, opts)
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->update_participant_subscriptions: #{e}"
end
```

#### Using the update_participant_subscriptions_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_participant_subscriptions_with_http_info(account_id, session_id, participant_id, opts)

```ruby
begin
  # Update Participant Subscriptions
  data, status_code, headers = api_instance.update_participant_subscriptions_with_http_info(account_id, session_id, participant_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling SessionsApi->update_participant_subscriptions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Account ID |  |
| **session_id** | **String** | Session ID |  |
| **participant_id** | **String** | Participant ID |  |
| **subscriptions** | [**Subscriptions**](Subscriptions.md) | The body describes the desired subscriptions for the Participant. --- If a body is provided it will result in direct control over what Participants are subscribed to.    - if the participants Array is provided and not empty, that list of Participants will be subscribed To   - if the participants Array is missing or empty, and the sessionId is provided, the participant will be subscribed to the session, including all subsequent changes to the membership of the session   - if the sessionId and the participant Array are both missing or empty, no subscriptions will be created | [optional] |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

