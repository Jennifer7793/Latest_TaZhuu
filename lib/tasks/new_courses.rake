namespace :db do
  desc "generate fake courses"
  u = User.random
  10.times do |i|
  u.courses.create(name: Faker::Movies::HowToTrainYourDragon.character, 
                   price: Faker::Number.between(from: 1, to: 10), 
                   hour: Faker::Number.between(from: 1, to: 10))
  # Course.create()
  end
end