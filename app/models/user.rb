class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { in: 1..128 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :hosted_events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :event_attendees, foreign_key: 'attendee_id'

  has_many :attended_events, through: :event_attendees, source: :event

  def attending?(event_id)
    attended_events.exists?(id: event_id)
  end

  def find_event_relationship(event)
    event_attendees.find_by(event_id: event.id)
  end

  def owns?(event)
    event.creator == self
  end
end
