# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# default admin
User.create(email:"root@example.com", password:"123456", role:"admin")
puts "Default admin created"


#category created
Category.destroy_all

category_list = [
  {name: "3C"},
  {name: "食品"},
  {name: "傢俱"},
  {name: "書籍"},
  {name: "廚房"},
  {name: "生活"},
  {name: "清潔"},
  {name: "服飾"}
]

category_list.each do |category|
  Category.create(name: category[:name])
end
puts "Now you have #{Category.count} categories!"
