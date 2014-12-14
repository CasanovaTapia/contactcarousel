class Contact < ActiveRecord::Base
  belongs_to :dial
  belongs_to :conversation
  belongs_to :investing
  belongs_to :timing
  belongs_to :motivator
  has_many :properties, dependent: :destroy

  validates :name, presence: true

  default_scope { order('updated_at DESC') }

  def next
    Contact.where("contacts.id > ?", self.id).order("contacts.id ASC").limit(1)
  end

  def previous
    Contact.where("contacts.id > ?", self.id).order("contacts.id DESC").limit(1)
  end
end
