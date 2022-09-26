# Config and Basic Auth

## APIMatic

```ruby
bandwidth_client = Bandwidth::Client.new(
    messaging_basic_auth_user_name: BW_USERNAME,
    messaging_basic_auth_password: BW_PASSWORD
)
messaging_client = bandwidth_client.messaging_client.client
```

## OpenAPIGenerator

```ruby
OpenapiClient.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
end
messaging_client = OpenapiClient::MessagesApi.new()
```

# Send SMS

## APIMatic
```ruby
account_id = BW_ACCOUNT_ID

body = MessageRequest.new
body.application_id = BW_MESSAGING_APPLICATION_ID
body.to = [USER_NUMBER]
body.from = BW_NUMBER
body.text = "Hello World!"

messaging_client.create_message(account_id, body)
```

## OpenAPIGenerator

```ruby
account_id = BW_ACCOUNT_ID

body = OpenapiClient::MessageRequest.new(
      application_id: BW_MESSAGING_APPLICATION_ID.to_s,
      to: [USER_NUMBER],
      from: BW_NUMBER,
      text: "ruby new sdk test"
)

messaging_client.create_message(account_id, body)
```

# OpenApiGenerator Quirks

* The Get Messages function defaults its return type to 'File', this downloads a temporary file that must be written to the disk to be accessed. 
     * Adding `debug_return_type: 'String'` to the function arguments overrides this and saves the file data as a string.
* All of the files in `openapi_client.rb` needed their `require` to be changed to `require_relative`.
* Using the configs default HTTP client, typhoeus, generates libcurl issues on Windows Machines.
* Switching to Farady for the HTTP client fixes the libcurl issue, but the SDK uses a deprecated form of Faraday's `basic_auth`. This looks like its fixed in a PR on their repo, but its not in prod yet. Changing `conn.basic_auth(config.username, config.password)` to `conn.request(:basic_auth, config.username, config.password)` in `api_client.rb` line 59 is the fix.
* The sdk generator writes code in the gemspec file that cannot be run in Windows, resulting in an empty gem if used.
      *   `s.files         = Dir['./**/*']` and `s.test_files    = Dir['spec/*']` fixes this
* To get a custom url, instead of setting the `environment` parameter in the config, you must make a custom operation in `configuration.rb`
``` ruby
"Pipedream": [
          {
            url: "https://d6979da481772c167be0edcd10eb64d7.m.pipedream.net",
            description: "testing"
          }
        ],
```
this must go in `operation_server_settings` and then `:operation => :"Pipedream",` must go in `new_options = opts.merge(` for the method you are calling within the `?_api.rb` file for the specific api
