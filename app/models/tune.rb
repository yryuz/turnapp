class Tune < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 1 } do
    validates :genre_id
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

end
