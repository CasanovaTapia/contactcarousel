class Investing < ActiveRecord::Base
  has_many :contacts
  has_many :calls
end
