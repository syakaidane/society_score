class Score < ApplicationRecord

  has_one_attached :score_image
  mount_uploader :score, ScoreUploader

  has_many :order_details
  has_many :cart_items
  has_many :favorites, dependent: :destroy
  belongs_to :genre

  validates :score_name, presence: true
  validates :artist_name, presence: true
  validates :composer, presence: true
  validates :arranger, presence: true
  validates :grade, presence: true
  validates :file_format, presence: true
  validates :page, presence: true
  validates :score_caption, presence: true
  validates :without_tax, presence: true
  validates :score, presence: true
  validates :score_image, presence: true

  def get_image(width, height)
    unless score_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    score_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end

  def self.looks(search, word)
    @score = Score.where("score_name LIKE?","%#{word}%")
  end

  def favorited?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def with_tax
    tax = 1.1
    (without_tax * tax).floor
  end

end
