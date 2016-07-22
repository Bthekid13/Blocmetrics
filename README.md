#Blocmetrics
[![Code Climate](https://codeclimate.com/github/Bthekid13/Blocmetrics/badges/gpa.svg)](https://codeclimate.com/github/Bthekid13/Blocmetrics)
[![Build Status](https://travis-ci.org/Bthekid13/Blocmetrics.svg?branch=master)](https://travis-ci.org/Bthekid13/Blocmetrics)

An API that track events on a website.

Demo: [blocmetrics.com] (https://wil-burke-blocmetrics.herokuapp.com

#Blocmetrics in a nutshell:

  Client-side Javascript snippets (you plug them in) allow you to track events (page visits) on your website.

  A Server-side API saves those events to a database––which you can access anytime.

  Page visits are illustrated by colorful charts, so analyzing your data is a stress free task!

#Getting Started

1. insert this Javascript into your application.js file:
```javaScript
var blocmetrics = {};
  blocmetrics.report = function(eventName) {

    var event = {event: { name: eventName}};

    var request = new XMLHttpRequest();

    request.open("POST", "http://localhost:3001/api/events", true);

    request.setRequestHeader('Content-Type', 'application/json');

    request.send(JSON.stringify(event));
 };
```


2. Add this yield statement after the default yield at the bottom of your views/layouts/application.html.erb file:

```ruby
<%= yield :analytic %>

```


3. Finally, Add this line at the bottom each page that you want to track:

```javaScript
<% content_for :analytic do %>
  <script type="text/javascript"> $(document).ready(function(){ blocmetrics.report("Topic Show Visit"); }); </script>
<% end %>
```


# Support

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as possible to so we can squash whatever might pop up.

https://github.com/Bthekid13/Blocmetrics/issues

#Kudos

Shout out to my Bloc teacher Alexander Miller (Prof. X) and the Bloc community for assisting me in making this immaculate web application.

#Copyright

copyright:: (c) Copyright 2015 Blocipedia. All Rights Reserved.
