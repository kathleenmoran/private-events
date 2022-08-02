class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 1..50 }
  validates :description, presence: true, length: { in: 1..200 }
  validates :time, presence: true
  validates :location, presence: true, length: { in: 1..50 }

  scope :future, -> { where('time > ?', DateTime.now) }
  scope :past, -> { where('time <= ?', DateTime.now) }

  belongs_to :creator, class_name: 'User'

  has_many :event_attendees, foreign_key: 'event_id'

  has_many :attendees, through: :event_attendees, source: :user
end
