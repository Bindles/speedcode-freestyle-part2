module ProfilesHelper
  def to_age(birthday)
    return "Not specified" if birthday.nil?

    age = ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
    "#{age} years old"
  end

  def show_age
    p ((Time.zone.now - @profile.birthday.to_time) / 1.year.seconds).floor
  end
end
