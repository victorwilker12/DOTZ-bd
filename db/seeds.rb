# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Admin.find_by(email: "admin@example.com")
    Admin.create!(email:"admin@example.com", password:"adminpassword", password_confirmation:"adminpassword")
end

unless Client.find_by(email:"client@example.com")
    Client.create!(email:"client@example.com", password:"clientpassword", password_confirmation:"clientpassword")
end