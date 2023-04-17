# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Contact.destroy_all
User.destroy_all
Account.destroy_all

account1 = Account.create(
    name: "Steve's Office",
    address1: "123 Main St",
    address2: "Suite 1",
    city: "New York",
    state: "NY",
    zip: "12345",
    phone_number: "(954) 121-4321"
)

user1 = User.create(
    first_name: "Steve",
    last_name: "Smith",
    email: "steve@aelogica.com",
    password: "password123",
    photo: "https://i.imgur.com/3ZQ3Z0x.jpg",
    account_id: account1.id
)

contact1 = Contact.create(
    first_name: "John",
    last_name: "Doe",
    email: "john@gmail.com",
    phone_number: "(954) 456-7890",
    account_id: account1.id
)

contact2 = Contact.create(
    first_name: "Jane",
    last_name: "Peterson",
    email: "jane@gmail.com",
    phone_number: "(954) 234-5678",
    account_id: account1.id
)

contact3 = Contact.create(
    first_name: "Mike",
    last_name: "Anderson",
    email: "mike@gmail.com",
    phone_number: "(954) 987-6543",
    account_id: account1.id
)

contact4 = Contact.create(
    first_name: "Sally",
    last_name: "Ashley",
    email: "sally@gmail.com",
    phone_number: "(954) 123-4567",
    account_id: account1.id
)
