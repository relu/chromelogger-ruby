# Chromelogger for Ruby

Ruby gem for logging to Google Chrome's console using the [Chrome Logger
extension](http://chromelogger.com/) by [ccampbell](https://github.com/ccampbell/).
It also provides a middleware class you can with any Rack based application.

## Installation

Add this to line to your Gemfile

    gem 'chromelogger'

And then execute

    $ bundle

Or just install it directly

    $ gem install chromelogger

## Use the middleware with Rails

For Rails you would add the line below to your application's configuration
file (e.g. config/application.rb). You would probably want to use it in
development only so ```config/environments/development.rb``` would be a better fit.

```ruby
config.middleware.use "Chromelogger::Middleware"
```

Then you can make use of the logger by calling any of the methods

```ruby
Chromelogger::Console.log()
Chromelogger::Console.warn()
Chromelogger::Console.error()
```

## TODO

* Write tests
