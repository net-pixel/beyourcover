# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "abc",
  email: "abc@example.com",
  password: 'password',
  password_confirmation: "password",
  last_name: "鈴木",
  first_name: "太郎",
  last_kana: "スズキ",
  first_kana: "タロウ",
  admin: true
)
Address.create!(
  post_code: "001-0000",
  prefecture: "東京都",
  city: '渋谷区',
  address: "道玄坂2-3-1",
  building: "フォンティスビル7F",
  phone_number: "09066666666",
  user_id: 1,
)

