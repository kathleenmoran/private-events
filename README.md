# Private Events

A website where users can sign up for and create events.

See a live version of this website [here](http://private-events.club/). Sign in with the email `benjaminfranklin@gmail.com` and password `benjaminfranklin` to view an account that has already been created.

## Demo

https://user-images.githubusercontent.com/43465901/184425743-b55d6ea6-8d6c-4b03-95f4-0311de46162c.mov

## Features

* Users can create, edit, and delete events
* Users can attend other users' events
* Users can view all events they have signed up for or created
* Events are sorted into past and future sections
* Form validation provides feedback if user has entered invalid data
* User is authenticated before performing actions such as creating events and viewing private events

## How to Use

To view the live site, go [here](http://private-events.club/). Sign in with the email `benjaminfranklin@gmail.com` and password `benjaminfranklin` to view an account that has already been created.

To run locally you must have [Ruby]https://www.ruby-lang.org/en/downloads/) and [Ruby on Rails](https://guides.rubyonrails.org/v5.0/getting_started.html) installed. This application was written Ruby 3.1 and Ruby on Rails 7.

If you have Ruby and Ruby on Rails installed, clone this repo:
```
$ git clone git@github.com:kathleenmoran/private-events.git
```

Install the required gems:
```
$ bundle install
```

Migrate the database:
```
$ rails db:migrate
```

Run a local server:
```
$ rails server
```

Finally, navigate to `localhost:3000` in your browser.

## Style Guide

Written with the community [Ruby style guide](https://rubystyle.guide/).

## Future Improvements

* Allow users to invite other users to their private events

## Gratitudes

This project is based off of an assignment from [The Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-private-events). Inspiration for the layout of this README was drawn from [ChargrilledChook's READMEs](https://github.com/ChargrilledChook).
