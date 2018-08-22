# frozen_string_literal: true

def clear_model_classes(model_classes)
  model_classes.each { |clazz| clazz.try(:destroy_all) }
  puts "clear: #{model_classes.join(', ')}"
end

def puts_user_info(user)
  puts user.inspect
end

puts '-- seed'
clear_model_classes [User, Body, Family, Note]

test1 = FactoryBot.create(:user, email: 'test1@example.com')
FactoryBot.create(:body, :with_notes, family: test1.family, note_count: 0)
FactoryBot.create(:body, :with_notes, family: test1.family, note_count: 3)
FactoryBot.create(:body, :with_notes, family: test1.family, note_count: 20)
puts_user_info test1
