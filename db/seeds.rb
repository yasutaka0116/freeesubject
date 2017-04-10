# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 10.times do |no|
#   # User.create(:name => "ユーザー #{no}", :name => "名前 #{no}" :uniqueid => "#{no}", :email: "test@test#{no}.com", )
#   user = User.new(:name => "ユーザー #{no}", :uniqueid => "#{no}", :email => "test@test#{no}.com", :password => "sssssssss#{no}")
#   user.save!
# end

# 10.times do |no|
#   Talk.create(message: "トーク#{no}", sender_id: 1, recipient_id: 13)
# end

10.times do |no|
  Talk.create(message: "トーク#{no}", sender_id: 13, recipient_id: 1)
end
