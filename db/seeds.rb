Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.product,
                        description: Faker::Lorem.sentence(250, false, 0).chop)
end

p "Created #{Product.count} products"
