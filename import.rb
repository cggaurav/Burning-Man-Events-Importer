require 'rubygems'
require 'google/api_client'
require 'json'
require 'pp'
require 'date'

client = Google::APIClient.new
client.authorization.client_id = ''
client.authorization.client_secret = ''
client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
client.authorization.access_token = ""
calendar = client.discovered_api('calendar', 'v3')

# pp DateTime.parse("2013-08-28 17:00:00").to_s

# http://bit.ly/bm13events
count = 0;
events = JSON.parse(File.read('events.json'));
events[0..100].each do |event|
  # puts event.inspect
  event['occurrence_set'].each do |timespan|
    # pp event

    description = event['description']
    description += ("\n" +  "Visit " + event['url']) rescue ""
    description += ("\n" +  event['event_type']['abbr']) rescue ""

    description += ("\n" +  event['event_type']['label']) rescue ""

    name = event['hosted_by_camp']['name'] rescue ""
    new_event = {
      "kind" => "calendar#event",
      "status" => "confirmed",
      "htmlLink" => event['url'],
      "summary" => event['title'],
      "description" => description,
      "location" => event['print_description'],
      "organizer" => {
        "email" => "",
        "displayName" => name
      },
      "start" => {
        "dateTime" => DateTime.parse(timespan['start_time']).to_s.gsub("+00:00", "-06:00")
      },
      "end" => {
        "dateTime" => DateTime.parse(timespan['end_time']).to_s.gsub("+00:00", "-06:00")
      },
      "transparency" => "transparent",
      "attendees" => [
        {
          "email"  => "support@burningman.com"
        }
      ],
      "attendeesOmitted" => false,
      "anyoneCanAddSelf" => true,
      "guestsCanInviteOthers" => true,
      "guestsCanModify" => true,
      "guestsCanSeeOtherGuests" => true
    }
    result = client.execute(:api_method => calendar.events.insert,
                            :parameters => {'calendarId' => 'n4llvehs9ea900fnp7t4arn1bo@group.calendar.google.com'},
                            :body => JSON.dump(new_event),
                            :headers => {'Content-Type' => 'application/json'})
    # pp new_event
    pp result if(result.data.id == nil)
    count += 1
    pp count
  end
end