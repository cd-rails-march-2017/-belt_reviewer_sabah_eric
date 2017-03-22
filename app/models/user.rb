class User < ActiveRecord::Base
has_many :events, foreign_key: 'host_id'

has_many :rsvps, foreign_key: 'attendees_id'
has_many :attending, source: :event, through: :rsvps

EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
validates :fname, :lname, presence: true, length: { in: 2..20 }
validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
validates :city, :state, presence: true
validates :state, length: { :is => 2 }
validates :password, presence: true, length: {in: 7..16}
def name
  "#{fname} #{lname}"
end

end
