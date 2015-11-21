class Due2dayList < ActiveRecord::Base
  has_many :due2day_items

  validates :title, :presence => true

end
