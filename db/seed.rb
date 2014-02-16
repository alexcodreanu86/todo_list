require 'faker'
require_relative '../config/application'

3.times do
  Task.create(content: Faker::Lorem::sentence(word_count = 5))
end