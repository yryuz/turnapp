class Comment < ApplicationRecord

  validates :text, presence: true 
  
  belongs_to :tune
  belongs_to :user 
end
