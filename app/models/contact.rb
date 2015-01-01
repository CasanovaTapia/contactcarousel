class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :dial
  belongs_to :conversation
  belongs_to :investing
  belongs_to :timing
  belongs_to :motivator
  has_many :properties, dependent: :destroy
  has_many :calls, dependent: :destroy

  accepts_nested_attributes_for :calls

  validates :name, presence: true

  default_scope { order('updated_at ASC') }

  scope :next, lambda { |id| where("id > ?", id).order("id ASC") }
  scope :previous, lambda { |id| where("id < ?", id).order("id DESC") }

  searchkick

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Contact.create! row.to_hash
    end
  end

  def previous
    if self.id == User.current.contacts.first.id || self.id == 1
      User.current.contacts.last
    else
      User.current.contacts.where("id < ?", self.id).last
    end
  end

  def next
    if self.id == User.current.contacts.last.id
      User.current.contacts.first
    else
      User.current.contacts.where("id > ?", self.id).first
    end
  end
end
