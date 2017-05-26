class Movie < ApplicationRecord
  has_many :reviews
  belongs_to :category

  validates :movie_img, attachment_presence: true
  has_attached_file :movie_img, styles: { movie_index: "250x350>", movie_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :movie_img, content_type: /\Aimage\/.*\z/

  def self.search(search)
  where("title LIKE ? OR country LIKE ? OR director LIKE? OR language LIKE?
  OR category_id LIKE ?",
  "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
