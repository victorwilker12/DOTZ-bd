# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if !(Admin.find_by(email: "admin@example.com"))
    p "Criando Admin padrão"
    Admin.create!(email:"admin@example.com", password:"adminpassword", password_confirmation:"adminpassword")
end

unless Client.find_by(email:"client@example.com")
    p "Criando Client padrão"
    Client.create!(nome:"Sou um teste", saldo_dotz: 10000, email:"client@example.com", password:"clientpassword", password_confirmation:"clientpassword")
end

password = Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true)
10.times do |clients|
    Client.create!(
        nome: Faker::Name.name,
        email: Faker::Internet.email,
        cpf: "000.000.000-00",
        # saldo_dotz: 
        password: password,
        password_confirmation: password
    )

  
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