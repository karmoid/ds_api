# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    AdminUser.create!(email: 'karmoc@gmail.com', password: 'M@rc496527', password_confirmation: 'M@rc496527')
    Place.create(name: "default")
    playlist = Playlist.create(name: "default")
    page = Page.create(url: "http://localhost:3000")
    Playitem.create(order: 0, cmd: 1, page_id: page.id, value: 0, playlist_id: playlist.id)
