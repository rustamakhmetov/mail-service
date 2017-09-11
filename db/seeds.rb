# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# clear database
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if ['schema_migrations', 'ar_internal_metadata'].include? table

  # MySQL and PostgreSQL
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE")
end

Message.create(title: "Message1", text: "Здравствуйте, {{name}}. Ваш баланс: {{balance}}{{currency}}")
Account.create(email: Faker::Internet.email,
                        name: Faker::Name.name,
                        balance: Faker::Number.decimal(2).to_f,
                        currency: ["rub", "$"].sample)