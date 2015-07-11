class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  has_many :entries
  has_many :feed_entries, through: :entries, source: :feed

  validates :name, length: { in: 3..40 }

end
