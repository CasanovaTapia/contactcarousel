class Plan < ActiveRecord::Base
  validates :stripe_id, uniqueness: true
end
