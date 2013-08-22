require 'rubygems'
require 'google/api_client'
require 'json'

client = Google::APIClient.new
client.authorization.client_id = '245995055571-2rtmfneunrt9o9se61eo9aeqm3ou55ff.apps.googleusercontent.com'
client.authorization.client_secret = '6s7rUSPdK3ljCVF6awSVyXHT'
client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
client.authorization.access_token = "ya29.AHES6ZSkrXp1qN860yVTTUg5y6AGhbFRXbCgmCm7F7K5vcq4lVeyWg"
calendar = client.discovered_api('calendar', 'v3')

event = {
  'summary' => 'Appointment',
  'location' => 'Somewhere',
  'start' => {
    'dateTime' => '2013-08-03T10:00:00.000-07:00'
  },
  'end' => {
    'dateTime' => '2013-08-03T10:25:00.000-07:00'
  },
  'attendees' => [
    {
      'email' => 'cggaurav@gmail.com'
    }
  ]
}
event = {
  "kind": "calendar#event",
  "etag": etag,
  "id": string,
  "status": string,
  "htmlLink": string,
  "created": datetime,
  "updated": datetime,
  "summary": string,
  "description": string,
  "location": string,
  "colorId": string,
  "creator": {
    "id": string,
    "email": string,
    "displayName": string,
    "self": boolean
  },
  "organizer": {
    "id": string,
    "email": string,
    "displayName": string,
    "self": boolean
  },
  "start": {
    "date": date,
    "dateTime": datetime,
    "timeZone": string
  },
  "end": {
    "date": date,
    "dateTime": datetime,
    "timeZone": string
  },
  "endTimeUnspecified": boolean,
  "recurrence": [
    string
  ],
  "recurringEventId": string,
  "originalStartTime": {
    "date": date,
    "dateTime": datetime,
    "timeZone": string
  },
  "transparency": string,
  "visibility": string,
  "iCalUID": string,
  "sequence": integer,
  "attendees": [
    {
      "id": string,
      "email": string,
      "displayName": string,
      "organizer": boolean,
      "self": boolean,
      "resource": boolean,
      "optional": boolean,
      "responseStatus": string,
      "comment": string,
      "additionalGuests": integer
    }
  ],
  "attendeesOmitted": boolean,
  "extendedProperties": {
    "private": {
      (key): string
    },
    "shared": {
      (key): string
    }
  },
  "hangoutLink": string,
  "gadget": {
    "type": string,
    "title": string,
    "link": string,
    "iconLink": string,
    "width": integer,
    "height": integer,
    "display": string,
    "preferences": {
      (key): string
    }
  },
  "anyoneCanAddSelf": boolean,
  "guestsCanInviteOthers": boolean,
  "guestsCanModify": boolean,
  "guestsCanSeeOtherGuests": boolean,
  "privateCopy": boolean,
  "locked": boolean,
  "reminders": {
    "useDefault": boolean,
    "overrides": [
      {
        "method": string,
        "minutes": integer
      }
    ]
  },
  "source": {
    "url": string,
    "title": string
  }
}
result = client.execute(:api_method => calendar.events.insert,
                        :parameters => {'calendarId' => 'nft1rtut8a1khvrjg2pn4dqcs0@group.calendar.google.com'},
                        :body => JSON.dump(event),
                        :headers => {'Content-Type' => 'application/json'})
print result.data.id