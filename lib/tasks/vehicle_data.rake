namespace :vehicle_data do
  desc "Generate test data"
  task generate: :environment do
    80.times do
      Car.create!(
        make: Faker::Vehicle.make,
        model: Faker::Vehicle.model,
        color: Faker::Vehicle.color,
        price: Faker::Commerce.price(range: 1000000..8000000),
        size: [ "Full Size", "Compact" ].sample,
        engine_size: [ "V6", "V8" ].sample
      )
    end

    30.times do
      Bike.create!(
        make: Faker::Vehicle.make,
        model: Faker::Vehicle.model,
        color: Faker::Vehicle.color,
        price: Faker::Commerce.price(range: 500000..3000000),
        top_speed: rand(30..120)
      )
    end
  end
end
