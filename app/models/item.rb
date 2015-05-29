class Item < ActiveRecord::Base
  belongs_to :user

  def completed?
    completed == true
  end
  
end
