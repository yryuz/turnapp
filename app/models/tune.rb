class Tune < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  with_options presence: true do
    validates :name
    validates :url 
    validates :artist
    validates :genre_id
    validates :text
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
  end

  validates :text, length: { maximum: 15 }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

end
