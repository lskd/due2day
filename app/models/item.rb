class Item < ActiveRecord::Base
  belongs_to :list
  validates :content, :presence => true

  def completed?
      !completed_at.blank? # if its completed the completed field is not blank
  end
end
