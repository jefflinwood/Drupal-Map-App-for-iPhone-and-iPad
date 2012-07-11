Drupal Map App Example Project for iPhone and iPad
=============

This project is an example iPhone/iPad application with a common code base that pulls location-based information about businesses from a Drupal 7 web site, displays it on a Google Map inside an iPhone or iPad app, and then lets you pick a business to display.

Tested with PhoneGap 1.1.0 and XCode 4.2

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

XCode Project Setup Notes
------------------
* Create a new PhoneGap Application from XCode 4.2 to get started
* Add my fork of the ASIHTTPRequest (git://github.com/jefflinwood/asi-http-request.git) to your XCode Project (but only the Classes folder). 
      * In Terminal navigate to your development directory and enter: git clone git://github.com/jefflinwood/asi-http-request.git 
      * In Xcode right-click the Classes folder in the Project Navigator
      * Select 'Add files to <projectname' from the context menu.
      * Locate and select the ASIHTTPRequest directory.
* Add my fork of the Drupal IOS SDK (git://github.com/jefflinwood/drupal-ios-sdk.git) to your XCode Project. 
      * In Terminal enter: git clone git://github.com/jefflinwood/drupal-ios-sdk.git DrupalPhoneGapApp/Classes/drupal-ios-sdk
      * In Xcode right-click the Classes folder in the Project Navigator
      * Select 'Add files to <projectname' from the context menu.
      * Locate and select the DRUPAL-IOS-SDK directory.
* Add libz.1.2.5 as a dynamic library for your app
      * In Xcode select the project file and then navigate to the Build Phases tab of the project settings. 
      * Under the Build Phases tab locate the section called Link Binary With Libraries. 
        (If you do not see this section you can click the Add Build Phase button in the lower right and add it.) 
      * Expand the Link Binary with Libraries section and then click on the small '+' symbol in the bottom left corner of the section.
      * A dialog will be displayed listing all of the available libraries/frameworks. 
      * Locate and select libz.1.2.5 and press ADD.   
* Add CFNetwork as a Framework for your app
      * Repeat the above steps for the CFNetwork.Framework file.
* Add DrupalPlugin.m and DrupalPlugin.h from this project to your XCode PhoneGap project's plugins directory
      * In Terminal navigate to your development directory and enter: git clone git://github.com/jefflinwood/Drupal-Plugin-for-PhoneGap-for-iOS.git
      * Option drag DrupalPlugin.m and DrupalPlugin.h from the new repository to the projects Plugins directory.
* Add the javascript file to your XCode project's www directory
      * Option drag drupal-phonegap.js from the new repository to the project's www (or www/js) folder.
* Reference the javascript file in your index.html
      * Add the following to index.html:
       <script type="text/javascript" charset="utf-8" src="drupal-phonegap.js"></script>
* Add DrupalPlugin to your PhoneGap.plist configuration file's list of plugins. 
      * In Xcode's Project Navigator select Supporting Files/PhoneGap.plist (or Supporting Files/Cordova.plist).
      * Select the last plugin in the list (there are 14 out of the box) and then click the Plus sign. 
      * Type "DrupalPlugin" into both boxes of the new plugin and save the file.  Type should be string.
* For PhoneGap 1.1.0, you will need to also add that Drupal Server to the list of allowed external hosts.
      * In Xcode's Project Navigator select Supporting Files/PhoneGap.plist (or Supporting Files/Cordova.plist).
      * Under ExternalHosts, using the technique described above, add *.yourserver.com and *.jquery.com (if it doesn't already exist). 
* You will need to edit DIOS Config file (Settings.h) to reference your Drupal server's services URL, main URL, and domain
      * in Xcode's Project Navigator select /Classes/drupal-ios-sdk/Settings.h


Thoughts/Questions/Improvements?
-------------
Send them to jlinwood@gmail.com

Or get in touch with me through my web site http://www.jefflinwood.com/



