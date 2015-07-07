class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :name, length: { in: 3..40 }

end
