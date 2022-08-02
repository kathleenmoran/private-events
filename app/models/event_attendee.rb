class EventAttendee < ApplicationRecord
  belongs_to :user, foreign_key: 'attendee_id', class_name: 'User'
  belongs_to :event, class_name: 'Event'

  def self.find_by_user_and_event(user_id, event_id)
    find_by(attendee_id: user_id, event_id: event_id)
  end
end
