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

categories=[
  {level1:"iPhone11",level1_children:[
                                      {level2:"a",level2_children:["1","2"]},
                                      {level2:"b",level2_children:["1","2"]},
                                      {level2:"c",level2_children:["1","2"]}
                                      ]
  },
  {level1:"iPhone11 Pro",level1_children:[
                                      {level2:"a",level2_children:["1","2","3"]},
                                      {level2:"b",level2_children:["1","2","3"]}
                                      ]
  },
  {level1:"iPhone11 Pro Max",level1_children:[
                                      {level2:"a",level2_children:["1","2"]},
                                      {level2:"b",level2_children:["1","2"]}
                                      ]
  },
  {level1:"AirPods",level1_children:[
                                      {level2:"a",level2_children:["1","2","3"]},
                                      {level2:"b",level2_children:["1","2","3"]},
                                      {level2:"c",level2_children:["1","2","3"]}
                                      ]
  }
]
categories.each.with_index(1) do |category,i|
  level1_var="@category#{i}"
  level1_val= Category.create(name:"#{category[:level1]}")
  eval("#{level1_var} = level1_val")
    category[:level1_children].each.with_index(1) do |level1_child,j|
      level2_var="#{level1_var}_#{j}"
      level2_val= eval("#{level1_var}.children.create(name:level1_child[:level2])")
      eval("#{level2_var} = level2_val")
        level1_child[:level2_children].each do |level2_children_val|
          eval("#{level2_var}.children.create(name:level2_children_val)")
        end
    end
end