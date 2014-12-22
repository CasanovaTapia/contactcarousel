class Contact < ActiveRecord::Base
  belongs_to :dial
  belongs_to :conversation
  belongs_to :investing
  belongs_to :timing
  belongs_to :motivator
  has_many :properties, dependent: :destroy

  validates :name, presence: true

  default_scope { order('updated_at DESC') }

  scope :next, lambda { |id| where("id > ?", id).order("id ASC") }
  scope :previous, lambda { |id| where("id < ?", id).order("id DESC") }

  searchkick
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Contact.create! row.to_hash
    end
  end

  def previous
    unless self.id == 1
      Contact.where("id < ?", self.id).first
    else
      Contact.first
    end
  end

  def next
    if self.id == Contact.first.id
      Contact.last
    else
      Contact.where("id > ?", self.id).last
    end
  end
end
