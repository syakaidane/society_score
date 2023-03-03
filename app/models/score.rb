class Score < ApplicationRecord
  
  has_one_attached :score_image
  
  has_many :order_details
  has_many :cart_items
  has_many :favorites
  belongs_to :genre
  
  validates :score_name, presence: true
  validates :score_caption, presence: true
  validates :without_tax, presence: true
  
  def get_image(width, height)
    unless score_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    score_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
  
  def with_tax
    tax = 1.1
    (without_tax * tax).floor
  end
  
end
