var request = require('request');
var eyes = require('eyes');
var gcal = require('google-calendar');
var google_calendar = new gcal.GoogleCalendar("AIzaSyBa0kbSh5eDps741jzwPUTKh1DUFcL5vZg");

var fs = require('fs');

// url = "http://api.merchii.com/sites/gauravmerchii-tumblr-com?_multi=true"
url = "http://playaevents.burningman.com/api/0.2/2013/event/"
request(url,{json:true} ,function (err, res, body) {
  if (!err && res.statusCode == 200) {
  	fs.writeFile('events.json', JSON.stringify(body, null, 4), function (err) {
  	  if (err) eyes.inspect("Error in writing events")
  	  else eyes.inspect("Finished writing");
  	});
  }
})

// nft1rtut8a1khvrjg2pn4dqcs0@group.calendar.google.com
// GoogleCalendar.events.insert = function(calendarId, event, option, callback)