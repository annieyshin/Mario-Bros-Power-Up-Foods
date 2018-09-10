class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country_of_origin, :presence => true

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
  select("products.name, count(products.rating) as reviews_count")
  .joins(:users)
  .group("products.id")
  .order("reviews_count DESC")
  .limit(10)
  )}


end
