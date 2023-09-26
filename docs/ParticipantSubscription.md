# Bandwidth::ParticipantSubscription

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **participant_id** | **String** | The Participant the subscriber will be subscribed to |  |
| **stream_aliases** | **Array&lt;String&gt;** | (optional) An array of specific streamAliases owned by the Participant that the subscriber will be subscribed to. Background: A streamAlias is created by a WebRTC client when it connects and declares a name for the related stream. The client is responsible for informing the application of any created streamAliases to enable the application to subscribe to specific streamAliases. Subscribing to a &#x60;streamAlias&#x60; that does not exist is undefined. If the array is empty all aliases are assumed. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::ParticipantSubscription.new(
  participant_id: 568749d5-04d5-483d-adf5-deac7dd3d521,
  stream_aliases: [&quot;alias_1&quot;,&quot;alias_2&quot;]
)
```

