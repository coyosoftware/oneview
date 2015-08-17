# Oneview

[![Build Status](https://travis-ci.org/coyosoftware/oneview.svg?branch=master)](https://travis-ci.org/coyosoftware/oneview) [![Gem Version](https://badge.fury.io/rb/oneview.svg)](http://badge.fury.io/rb/oneview) [![Test Coverage](https://codeclimate.com/github/coyosoftware/oneview/badges/coverage.svg)](https://codeclimate.com/github/coyosoftware/oneview) [![Code Climate](https://codeclimate.com/github/coyosoftware/oneview/badges/gpa.svg)](https://codeclimate.com/github/coyosoftware/oneview)

This gem simplifies the usage of [Oneview](http://www.oneview.com.br/) API

For more information regarding the API, visit the [documentation]

## Installation

Add this line to your application's Gemfile:

    gem 'oneview'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oneview

## Usage

Create a new instance of Oneview class passing your access token:

```ruby
	client = Oneview.new(YOUR_ACCESS_TOKEN)
```	

With the client instance, you can access the following resources:

* Contacts (client.contacts) **Only creation**
* Sms Sending (client.sms)
* Email Sending (client.email)

## Using the resources
### Creating new records
All resources implement a **create** method.

It can accept a hash with the parameters as described in the API [documentation] or an Entity object that reflects the API fields.

Currently the following entities are implemented:

* [Contact](lib/oneview/entity/contact.rb)
* [Phone](lib/oneview/entity/phone.rb)
* [Dynamic Field](lib/oneview/entity/dynamic_field.rb)
* [Email](lib/oneview/entity/email.rb)
* [SMS](lib/oneview/entity/sms.rb)

### Reading the response
All methods return an Oneview::Client::Response object. This objects contains the following attributes:

```ruby
	response = Oneview.new(YOUR_ACCESS_TOKEN).contacts.create(contact_entity)
	
	response.status			# Contains the status code of the request
	response.payload		# Contains the return data (JSON) of the request
	response.raw_response	# Contains the HTTParty response object
```

## Contributing

1. Fork it ( https://github.com/coyosoftware/oneview/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[documentation]: http://coyosoftware.github.io/
