
# Transcription Metadata

## Structure

`TranscriptionMetadata`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | - |
| `status` | `String` | Optional | The current status of the transcription. Current values are 'none', 'processing', 'available', 'error', 'timeout', 'file-size-too-big', and 'file-size-too-small'. Additional states may be added in the future, so your application must be tolerant of unknown values. |
| `completed_time` | `String` | Optional | - |
| `url` | `String` | Optional | - |

## Example (as JSON)

```json
{
  "id": null,
  "status": null,
  "completedTime": null,
  "url": null
}
```

