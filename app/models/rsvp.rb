class Rsvp < ActiveRecord::Base
  belongs_to :attendees, class_name: 'User'
  belongs_to :event
  validates_uniqueness_of :event_id, :scope => :attendees_id
end
