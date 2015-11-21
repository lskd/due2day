class Due2dayItem < ActiveRecord::Base
  belongs_to :due2day_list

  def completed?
      !completed_at.blank? # if its comopleted the completed field is not blank
  end
end
