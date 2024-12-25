class Vehicle < ApplicationRecord
  self.inheritance_column = :type # STI type column
end

class Car < Vehicle
  # Any specific methods or validations related to cars
end

class Bike < Vehicle
  # Any specific methods or validations related to bikes
end
