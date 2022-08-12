class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 1..50 }
  validates :description, presence: true, length: { in: 1..200 }
  validates :time, presence: true
  validates :location, presence: true, length: { in: 1..50 }

  scope :future, -> { where('time > ?', DateTime.now).order(:time) }
  scope :past, -> { where('time <= ?', DateTime.now).order(time: :desc) }
  scope :future_signed_out, -> { where('time > ? AND NOT private', DateTime.now).order(:time) }
  scope :past_signed_out, -> { where('time <= ? AND NOT private', DateTime.now).order(time: :desc) }
  scope :not_private, -> { where('NOT private') }

  belongs_to :creator, class_name: 'User'

  has_many :event_attendees, foreign_key: 'event_id', dependent: :destroy

  has_many :attendees, through: :event_attendees, source: :user, dependent: :destroy
end
