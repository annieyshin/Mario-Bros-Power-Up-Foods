class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country_of_origin, :presence => true

  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)}

  scope :madeinusa, -> { where(country_of_origin: "USA") }

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
      select("products.id, products.name, products.country_of_origin, count(reviews.id) as reviews_count")
      .joins(:reviews)
      .group("products.id")
      .order("reviews_count DESC")
      .limit(10)
      )}


end
