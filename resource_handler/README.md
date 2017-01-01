# Concerns::ResourceHandler
A concern that's used to simplify the rendering of certain objects. Useful if the response of most of your requests are pretty much the same.

## Requirements
* Ruby 2.3.3 or greater
* Ruby on Rails 4.2.5 or greater

## How it works
* Included in some controllers that handle rendering of html, js, and json.
* Also works if you also happen to use `remote: true` in your Rails forms. 

## How to use it
* Include it in a controller
* Add a method in your controller to return the correct resource
* Call `render_result`, `render_save_result`, or `render_destroy_result` when your controller's action is ready for it.