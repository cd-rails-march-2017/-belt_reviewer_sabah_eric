class Event < ActiveRecord::Base
  belongs_to :host, class_name: 'User', foreign_key: 'host_id'
  has_many :rsvps
  has_many :comments
  has_many :attendees, through: 'rsvps'
  validates :name, :date, :city, presence: true, :length => { :minimum => 2 }
  validates :state, presence: true, :length => { :is => 2 }
end
