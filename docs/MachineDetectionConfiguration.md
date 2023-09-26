# Bandwidth::MachineDetectionConfiguration

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **mode** | [**MachineDetectionModeEnum**](MachineDetectionModeEnum.md) |  | [optional][default to &#39;async&#39;] |
| **detection_timeout** | **Float** | The timeout used for the whole operation, in seconds. If no result is determined in this period, a callback with a &#x60;timeout&#x60; result is sent. | [optional][default to 15] |
| **silence_timeout** | **Float** | If no speech is detected in this period, a callback with a &#39;silence&#39; result is sent. | [optional][default to 10] |
| **speech_threshold** | **Float** | When speech has ended and a result couldn&#39;t be determined based on the audio content itself, this value is used to determine if the speaker is a machine based on the speech duration. If the length of the speech detected is greater than or equal to this threshold, the result will be &#39;answering-machine&#39;. If the length of speech detected is below this threshold, the result will be &#39;human&#39;. | [optional][default to 10] |
| **speech_end_threshold** | **Float** | Amount of silence (in seconds) before assuming the callee has finished speaking. | [optional][default to 5] |
| **machine_speech_end_threshold** | **Float** | When an answering machine is detected, the amount of silence (in seconds) before assuming the message has finished playing.  If not provided it will default to the speechEndThreshold value. | [optional] |
| **delay_result** | **Boolean** | If set to &#39;true&#39; and if an answering machine is detected, the &#39;answering-machine&#39; callback will be delayed until the machine is done speaking, or an end of message tone is detected, or until the &#39;detectionTimeout&#39; is exceeded. If false, the &#39;answering-machine&#39; result is sent immediately. | [optional][default to false] |
| **callback_url** | **String** | The URL to send the &#39;machineDetectionComplete&#39; webhook when the detection is completed. Only for &#39;async&#39; mode. | [optional] |
| **callback_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **username** | **String** | Basic auth username. | [optional] |
| **password** | **String** | Basic auth password. | [optional] |
| **fallback_url** | **String** | A fallback URL which, if provided, will be used to retry the machine detection complete webhook delivery in case &#x60;callbackUrl&#x60; fails to respond | [optional] |
| **fallback_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **fallback_username** | **String** | Basic auth username. | [optional] |
| **fallback_password** | **String** | Basic auth password. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MachineDetectionConfiguration.new(
  mode: null,
  detection_timeout: 15,
  silence_timeout: 10,
  speech_threshold: 10,
  speech_end_threshold: 5,
  machine_speech_end_threshold: 5,
  delay_result: false,
  callback_url: https://myServer.example/bandwidth/webhooks/machineDetectionComplete,
  callback_method: null,
  username: mySecretUsername,
  password: mySecretPassword1!,
  fallback_url: https://myFallbackServer.example/bandwidth/webhooks/machineDetectionComplete,
  fallback_method: null,
  fallback_username: mySecretUsername,
  fallback_password: mySecretPassword1!
)
```

