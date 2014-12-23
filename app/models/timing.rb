class Timing < ActiveRecord::Base
  has_many :contacts
  has_many :calls
end
