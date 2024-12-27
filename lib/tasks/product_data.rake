namespace :product_data do
  desc "Generate test data"
  task generate: :environment do
    32.times do
      Product.create(
        name: Faker::Commerce.product_name,
        description: Faker::Quote.jack_handey
      )
    end
  end
end
