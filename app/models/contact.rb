class Contact < ActiveRecord::Base
  belongs_to :call
  belongs_to :conversation
  belongs_to :investing
  belongs_to :motivator
  belongs_to :timing
  
  validates :name, presence: true

  default_scope { order('updated_at DESC') }
end
