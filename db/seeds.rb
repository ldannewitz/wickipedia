# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

tables = ActiveRecord::Base.connection.tables - ['schema_migrations']

tables.each do |table|
  ActiveRecord::Base.connection.execute "DELETE FROM `#{table}`"
  ActiveRecord::Base.connection.execute "ALTER TABLE `#{table}` AUTO_INCREMENT = 1"
end

Category.create!(name: 'Scented')
Category.create!(name: 'Birthday')
Category.create!(name: 'DIY')
Category.create!(name: 'Decorative')
Category.create!(name: 'Birthday')
Category.create!(name: 'Accessories')
Category.create!(name: 'Flameless')
Category.create!(name: 'Hazards')
Category.create!(name: 'History')

User.create!(username: "candleperson", email: "candle@candle.com", admin: true, password: "password")

