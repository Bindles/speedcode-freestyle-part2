namespace :sf_data do
  desc "Generate test data"
  task generate: :environment do
    20.times do
      StreetFighter.create(
        quote: Faker::Games::StreetFighter.quote,
        character: Faker::Games::StreetFighter.character,
        move: Faker::Games::StreetFighter.move
      )
    end
  end
end
