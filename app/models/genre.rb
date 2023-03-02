class Genre < ApplicationRecord
  
  has_many :scores
  validates :genre_name, presence:true, uniqueness: true
  
end
