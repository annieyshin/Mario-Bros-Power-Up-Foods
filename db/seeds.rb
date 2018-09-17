Product.destroy_all
Review.destroy_all

50.times do
  product = Product.create!(name: Faker::Food.ingredient,
                  country_of_origin: Faker::Address.country,
                  cost: Faker::Number.digit
                )
  5.times do
    Review.create!(description: Faker::Lorem.paragraph_by_chars(242),
                  rating: Faker::Number.between(1, 5),
                  product_id: product.id
                  )
  end
end


p "Created #{Product.count} products"

p "Created #{Review.count} reviews"
