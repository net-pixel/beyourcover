# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "admin",
  email: "abc@example.com",
  password: 'password',
  password_confirmation: "password",
  last_name: "admin",
  first_name: "admin",
  last_kana: "アドミン",
  first_kana: "アドミン",
  admin: true
)
Address.create!(
  destination_last: "admin",
  destination_first: "admin",
  destination_last_kana: "アドミン",
  destination_first_kana: "アドミン",
  post_code: "001-0000",
  prefecture_id: 1,
  city: '渋谷区',
  address: "道玄坂2-3-1",
  building: "フォンティスビル7F",
  phone_number: "09066666666",
  user_id: 1,
)
User.create!(
  name: "test",
  email: "test@example.com",
  password: 'password',
  password_confirmation: "password",
  last_name: "山田",
  first_name: "太郎",
  last_kana: "ヤマダ",
  first_kana: "タロウ",
  admin: false
)
Address.create!(
  destination_last: "山田",
  destination_first: "太郎",
  destination_last_kana: "ヤマダ",
  destination_first_kana: "タロウ",
  post_code: "123-4567",
  prefecture_id: 1,
  city: '渋谷区',
  address: "道玄坂2-3-1",
  building: "フォンティスビル7F",
  phone_number: "09033332222",
  user_id: 2,
)

# 10.times do |i|
#   product = Product.new
#   product.name = Faker::Food.dish
#   product.detail = Faker::Lorem.paragraph_by_chars(number: 500)
#   product.brand = Faker::Name.male_first_name
#   product.price = Faker::Number.number(digits: 4)
#   product.category_id = Faker::Number.between(from: 1, to: 2)
#   product.postage = "出品者負担"
#   product.prefecture_id = Faker::Number.between(from: 1, to: 48)
#   product.shipping_day = "1〜2日で発送"
#   product.user_id = 1
#   product.save
# end

categories=[
  {level1:"iPhone 11"},
  {level1:"iPhone 11 Pro"},
  {level1:"iPhone 11 Pro Max"},
  {level1:"AirPods"},
  {level1:"AirPods Pro"}]
categories.each.with_index(1) do |category,i|
  level1_var="@category#{i}"
  level1_val= Category.create(name:"#{category[:level1]}")
  eval("#{level1_var} = level1_val")
end