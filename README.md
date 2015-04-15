Football API
============

[hackday-api.herokuapp.com](https://hackday-api.herokuapp.com/)

A Ruby on Rails app that provides football data in JSON format.
You can fork it and adjust to your own needs.

Installation
============

Install Ruby
------------

Use [RVM](http://rvm.io/) or [RBenv](https://github.com/sstephenson/rbenv) to install Ruby


    curl -sSL https://get.rvm.io | bash -s stable
    rvm install 2.2.1

Clone the repo
--------------

    git clone git@github.com:X8/football-api.git
    cd football-api
    bundle

Data files
==========

The organizers will provide you with sport data files in XML format.
Put the files to the db/data directory.

    cd db
    unzip sport-data.zip

PUSHER URL
==========

Copy .env.example to .env then edit the file and put your PUSHER_URL there.

    cp .env.example .env

Start the server
================

    bundle exec rails s

The server will start listening on port 3000.

Open [localhost:3000/api/leagues.json](http://localhost:3000/api/leagues.json) in your browser to check if it works.

API documentation
=================

The REST API is documented on [Apiary](http://docs.hackday1.apiary.io/).

Live events
===========

You can use the app to simulate a live match. The application uses [Pusher](https://pusher.com/)
to publish match events. You can subscribe to the events in your client. See the
[docs](https://pusher.com/docs/javascript_quick_start) to see how it works.

For example, you can replay Liverpool vs Manchester United action by action.
In order to start the replay run `script/replay` and supply the ID of the match you want to simulate.

    bundle exec ruby script/replay.rb 1439948

Check out the wiki to see [which matches you can simulate](https://github.com/X8/football-api/wiki/Matches%20with%20full%20coverage)

Deployment
==========

It is easiest to use [Heroku](https://devcenter.heroku.com/articles/getting-started-with-ruby#introduction) but of
course you can use whatever you are familiar with.
