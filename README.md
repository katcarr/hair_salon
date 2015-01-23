Hair Salon
==========

Creates a web app using Ruby to manage a hair salon's stylists and their clients.

Database Setup
--------------

```sh
$ psql
$ CREATE DATABASE hair_salon;
$ \c expense_organizer;
$ CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
$ CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
```
App Setup
----------

Assuming you have ruby installed. In the terminal:
```sh
$ gem install bundler
$ bundle
$ ruby app.rb
```

Go to http://localhost:4567 in your browser

Tests
-----

In psql

```sh
$ CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon
```

Testing the ruby methods can be done via rspec.

```sh
$ gem install rspec
$ rspec
```
Motivation
---------

This app was created to practice interacting with SQL databases using PostgreSQL, the PG gem and using one to many relationships.

License
-------

MIT License, copyright 2015. Created by Kathryn Carr.
