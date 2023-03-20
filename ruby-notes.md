# Generate Command
`openapi-generator generate -g ruby -i bandwidth.yml -c openapi-config.yml -o ./`

# Custom Base URL

* To get a custom url, instead of setting the `environment` parameter in the config, you must make a custom operation in `configuration.rb`
``` ruby
"Custom": [
  {
    url: "https://d6979da481772c167be0edcd10eb64d7.m.pipedream.net",
    description: "testing"
  }
],
```
this must go in `operation_server_settings` and then `:operation => :"Custom",` must go in `new_options = opts.merge(` for the method you are calling within the `?_api.rb` file for the specific api
