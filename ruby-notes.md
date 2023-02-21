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
