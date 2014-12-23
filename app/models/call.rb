class Call < ActiveRecord::Base
  belongs_to :contact
  belongs_to :dial
  belongs_to :conversation
  belongs_to :investing
  belongs_to :timing
  belongs_to :motivator
end
