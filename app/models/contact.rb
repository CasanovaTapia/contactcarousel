class Contact < ActiveRecord::Base
  validates :name, presence: true

  default_scope { order('updated_at DESC') }
end
