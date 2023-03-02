class CartScore < ApplicationRecord
  
  belongs_to :score
  belongs_to :customer
  
end
