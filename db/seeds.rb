# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.clear_active_connections!
puts "Clearing all existing records in the DB\n"
ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}") unless table == "schema_migrations"
end
puts "Done!\n\n"
Dir[Rails.root.join("db/seeds/*.rb")].sort.each do |file|
  puts "Seeding from #{file}"
  require file
  puts "Done!\n\n"
end