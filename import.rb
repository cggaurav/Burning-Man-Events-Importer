require 'rubygems'
require 'google/api_client'
require 'json'

client = Google::APIClient.new
client.authorization.access_token = "AIzaSyBlyDtsvh7NofEf-nmb4wt-IcmZCViloEQ"
service = client.discovered_api('calendar', 'v3')

event = {
  'summary' => 'Appointment',
  'location' => 'Somewhere',
  'start' => {
    'dateTime' => '2013-08-21T10:00:00.000-07:00'
  },
  'end' => {
    'dateTime' => '2013-08-22T10:25:00.000-07:00'
  },
  'attendees' => [
    {
      'email' => 'cggaurav@gmail.com'
    }
  ]
}
result = client.execute(:api_method => service.events.insert,
                        :parameters => {'calendarId' => 'nft1rtut8a1khvrjg2pn4dqcs0@group.calendar.google.com'},
                        :body => JSON.dump(event),
                        :headers => {'Content-Type' => 'application/json'})
puts result.data.inspect