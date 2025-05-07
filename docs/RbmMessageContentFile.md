# Bandwidth::RbmMessageContentFile

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file_url** | **String** | The URL of the media file. 100MB is the maximum file size. |  |
| **thumbnail_url** | **String** | The URL of the thumbnail image. Applies only to video file media. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmMessageContentFile.new(
  file_url: https://dev.bandwidth.com/images/bandwidth-logo.png,
  thumbnail_url: https://dev.bandwidth.com/images/bandwidth-logo.png
)
```

