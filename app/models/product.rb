class Product < ActiveRecord::Base
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country_of_origin, :presence => true

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}



end
