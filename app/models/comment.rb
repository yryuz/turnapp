class Comment < ApplicationRecord
  belongs_to :tune
  belongs_to :user 
end
