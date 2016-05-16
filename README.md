# Fawsade

Provides a few custom methods for the AWS Ruby SDK.

## Usage

```ruby
require "fawsade"

client = Fawsade::Client.new(
  region: "eu-west-1",
  access_key_id: "xxxx",
  secret_access_key: "xxxx")

client.instances_by_name(/api\d+/) => [#<struct Fawsade::Instance id="i-xxxx", dns="ip-xxxx.eu-west-1.compute.internal", name="api01">, #<struct Fawsade::Instance id="i-xxxx", dns="ip-xxxx.eu-west-1.compute.internal", name="api02">]

client.instance_by_id("i-xxxx") => #<struct Fawsade::Instance id="i-xxxx", dns="ip-xxxx.eu-west-1.compute.internal", name="api01">
```
