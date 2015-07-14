class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  has_many :saved_entries


  validates :name, length: { in: 3..40 }

end
