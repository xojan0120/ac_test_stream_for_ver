# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

room1 = Room.create
room2 = Room.create
Message.create(content: "room100のメッセージ1", room: room1)
Message.create(content: "room100のメッセージ2", room: room1)
Message.create(content: "room200のメッセージ1", room: room2)
Message.create(content: "room200のメッセージ2", room: room2)
