# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.find_by(email: "user@example.com")
    p "Criando Admin padrão"
    User.create!(nome:"Dotezao", email:"user@example.com", cpf:"000.000.000-00", password:"userpassword", password_confirmation:"userpassword", admin: true, client: false)
end

p "Cadastrando 10 produtos..."
10.times do |simulator|
    Product.create!(
        nome: Faker::Commerce.product_name,
        valor_dotz: Faker::Number.between(from: 200, to: 2500),
        estoque: Faker::Number.between(from: 10, to: 50)
    )
end
p "Produtos cadastrados!"