# Bandwidth::MmsMessageContent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **text** | **String** | The contents of the text message. Must be 2048 characters or less. | [optional] |
| **media** | **Array&lt;String&gt;** | A list of URLs to include as media attachments as part of the message. Each URL can be at most 4096 characters. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MmsMessageContent.new(
  text: Hello world,
  media: [&quot;https://dev.bandwidth.com/images/bandwidth-logo.png&quot;,&quot;https://dev.bandwidth.com/images/github_logo.png&quot;]
)
```

