# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(:name => "Public", :description => "Custom made for city riding in style!", :color => "Black", :price => 299.00, :image_url => "bikes6.jpg")

Product.create(:name => "Schramm", :description => "Custom made to impress all the girls!", :color => "Black", :price => 279.00, :image_url => "bikes2.jpg")

Product.create(:name => "Diesel", :description => "Custom made for stealth riding!", :color => "Black", :price => 279.00, :image_url => "bikes3.jpg" )

Product.create(:name => "Astor", :description => "Custom made for parks and picnics!", :color => "Orange", :price => 299.00, :image_url => "bikes4.jpg" )

Product.create(:name => "Abici", :description => "Custom made with love!", :color => "Baby Blue", :price => 299.00, :image_url => "bikes.jpg" )

Product.create(:name => "Mayfair", :description => "Custom made for country riding!", :color => "Red", :price => 299.00, :image_url => "bikes5.jpg" )
