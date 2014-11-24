# uniqush-rb

A ruby client for [uniqush-push](http://uniqush.org) the push notification server that handles GCM, APNS and others.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uniqush-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uniqush-rb

## Usage

This is a minimalistic client using [rest-client](https://github.com/rest-client/rest-client), it provides a client to handle HTTP requests to a uniqush-push server. Get full documentation on supported params for each request on [uniqush docs](http://uniqush.org/documentation/usage.html).

```ruby
require "uniqush-rb"

uniqush = Uniqush::Client.new("http://localhost:9898")
```

### Managing services

```
# GET /addpsp
uniqush.add_service(service: "gravity_calculator", pushservicetype: "gcm", projectid: "com.grav.calc", apikey: "foobarbaz")

# GET /rmpsp
uniqush.remove_service(service: "gravity_calculator", pushservicetype: "gcm", projectid: "com.grav.calc", apikey: "foobarbaz")
```

### Managing subscriptions

```
# GET /subscribe
uniqush.subscribe_device(service: "gravity_calculator", subscriber: "198", pushservicetype: "gcm", regid: "foobarbaz")

# GET /unsubscribe
uniqush.unsubscribe_device(service: "gravity_calculator", subscriber: "198", pushservicetype: "gcm", regid: "foobarbaz")
```

### Pushing

```
# GET /push
uniqush.push(service: "gravity_calculator", subscriber: "198", msg: "Gravity is pretty low, float yo!")
```

### Housekeeping

```
# GET /version
uniqush.version

# GET /stop
uniqush.stop
```

## Contributing

1. Fork it ( https://github.com/rafaelbandeira3/uniqush-rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
