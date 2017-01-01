# Concerns::Geocode
* 

## Requirements
* Ruby 2.3.3 or greater
* Ruby on Rails 4.2.5 or greater
* Geocoder gem. See https://github.com/alexreisner/geocoder

## How it works
* This concern is used to make a model searchable by distance, either by IP address or street address.
* The street address is fetched when an IP address is provided and there is no address currently stored.
* If a street address is already provided, it uses that instead of the IP address to search for objects via a certain distance.

## How to use it
* Include it in any model you want to track location for
* Make sure your model has these attributes (database columns)
  * `address` - 
  * `ip_address` (If you use Devise, you can use `current_sign_in_ip` or `last_sign_in_ip` instead, just make sure to update the concern's `provided_address` method to return that instead
  * `latitude` and `longitude`