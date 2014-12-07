#Bandland
A clone of the popular music-sharing website Bandland.com. Please feel free to log-in as the demo user.  Play around, discover music, add your band, or upload some tracks!

**[Live Demo](http://www.bandland.rocks)**

##Technologies

###Rails

Uses RESTful routes and models to easily create / read / update / destroy models.
Uses custom jBuilder to return only select / necessary data to Backbone.js models.
Custom user authentication and validations.  Users create bands / artists which may have albums and / or songs.  Users can also follow bands or other users and add albums to their collections.

###Backbone.js

Combines the MVC design paradigm with custom JSON returned from jBuilder views in Rails to allow the site to allow quick navigation and loading of user / band / album / song data.

### Paperclip

Combined with Amazon S3 - allows the site to quickly upload and save user, band, and album images as well as song files and images.

###CSS

CSS is entirely custom. No uses of Bootstrap or any other styling framework.

##To do

- Fix OAuth (12/1/14:  Done!  OAuth is working with Facebook.  Might try to implement other logins)
- Fix search
- Add band dropdown to album and song forms
- Make music player look a whole lot nicer
- Carry over collections and following to Backbone
- Clean up user dashboard
- Add more seed data!