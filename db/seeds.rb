# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Favorite.destroy_all
Task.destroy_all
List.destroy_all
User.destroy_all

puts "Creating seeds"

users_attributes = [
  {
    email: 'maria@maria.com',
    password: 'maria123'
  },
  {
    email: 'joao@joao.com',
    password: 'joao123'
  }
]
User.create!(users_attributes)
puts "#{User.count} create"

user_first = User.first
user_last = User.last
lists_attributes = [
  {
    name: 'Market',
    visibility: true,
    user_id: user_first.id
  },
  {
    name: 'Bills',
    visibility: false,
    user_id: user_last.id
  }
]
List.create!(lists_attributes)
puts "#{List.count} create"

list_market = List.first
list_bill = List.last
tasks_attributes = [
  {
    list_id: list_market.id,
    name: 'butter',
    check: false
  },
  {
    list_id: list_market.id,
    name: 'milk',
    check: false
  },
  {
    list_id: list_market.id,
    name: 'chocolate',
    check: true
  },
  {
    list_id: list_bill.id,
    name: 'water',
    description: 'on-line',
    check: false
  },
  {
    list_id: list_bill.id,
    name: 'internet',
    description: 'on bank',
    check: false
  },
  {
    list_id: list_bill.id,
    name: 'ligth',
    description: 'on-line',
    check: true
  }
]
Task.create!(tasks_attributes)
puts "#{Task.count} create"
