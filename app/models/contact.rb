class Contact < ActiveRecord::Base
  belongs_to :dial
  belongs_to :conversation
  belongs_to :investing
  belongs_to :timing
  belongs_to :motivator

  validates :name, presence: true

  default_scope { order('updated_at DESC') }
end
