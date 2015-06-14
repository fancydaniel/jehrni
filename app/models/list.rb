class List < ActiveRecord::Base
  has_many :items

  validates :name, length: { in: 3..40 }

end
