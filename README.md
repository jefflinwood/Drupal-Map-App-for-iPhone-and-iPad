Drupal Map App Example Project for iPhone and iPad
=============

This project is an example iPhone/iPad application with a common code base that pulls location-based information about businesses from a Drupal 7 web site, displays it on a Google Map inside an iPhone or iPad app, and then lets you pick a business to display.

Credit to Open Source iOS Libraries used in this App
-------------
* AFNetworking - https://github.com/AFNetworking/AFNetworking - this great HTTP networking library makes async HTTP REST calls very easy to do. Much credit given here for all of the heavy lifting
* SVProgressHUD - https://github.com/samvermette/SVProgressHUD - the activity indicator that Apple should have included with iOS - works great for showing progress while downloading networked data

Drupal 7 Setup
-------------
I'd like to bundle all of the Drupal 7 functionality together into a Drupal "app" (different from a mobile app), or possibly just a feature. Basically, the modules you need are:
* Services 3
* ctools
* Geocoder
* Geofield
* Views
* Services Views
* Address Field

I added a REST endpoint with access to get nodes, and access to get views. I also created a content type called business with an image field, an address field, and a geofield. There's a simple view that just returns all businesses, but I would like to improve that with proximity search. Unfortunately, the current proximity search solution for Geofield doesn't seem to let me alter the origin point from the view's arguments, so there is some work to be done there.

I used the Acquia Dev Desktop to build this Drupal 7 site locally, so I don't have it up and running on a server just yet.

The URL for your Drupal site is in AppData.m - change the REST URL to match your site's end point, and change the image URL to match your site's image directory for large image thumbnails.

Thoughts/Questions/Improvements?
-------------
Send them to jlinwood@gmail.com
Get in touch with me through my web site http://www.jefflinwood.com/



