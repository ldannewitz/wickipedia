# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

Category.destroy_all
User.destroy_all
Article.destroy_all
Edit.destroy_all

accessories = Category.create!(name: 'Accessories')
birthday = Category.create!(name: 'Birthday')
diy = Category.create!(name: 'DIY')
decorative = Category.create!(name: 'Decorative')
flameless = Category.create!(name: 'Flameless')
hazards = Category.create!(name: 'Hazards')
history = Category.create!(name: 'History')
roman = Category.create!(name: 'Roman')
scented = Category.create!(name: 'Scented')

user = User.create!(username: "candleperson", email: "candle@candle.com", admin: true, password: "password")

Article.create!(title: 'Rojo 16 Costa Brava Bark 3-Votive T-Light Holder in Silver', category: accessories ).edits.create(editor:user, content: "Create a stunning display with the Rojo 16 Bark Votive T-Light Holder. Featuring an exquisite natural-looking texture forged out of brass and complete with 3 champagne-colored candle cups, it adds a touch of nature-inspired beauty to your home's ambiance.")

Article.create!(title: 'Sesame Street Elmo Number 2 Birthday Cake Candle', category: birthday, featured:true ).edits.create(editor:user, content: "This is the perfect candle to use at your child's Elmo themed 2nd birthday party. The candle is blue with blue stars and Elmo standing on top of the number 2 ready to slide down.")

Article.create!(title: 'Gilded animal candles', category: diy ).edits.create(editor:user, content: "These would be just as cute on a birthday cake as they would as standalone decor. Tutorial at http://www.thesweetestoccasion.com/2011/08/diy-party-animal-candles/.")

Article.create!(title: 'Blown Glass Hurricane', category: decorative, featured:true ).edits.create(editor:user, content: "Colombian glassblowers imbue these romantic glass hurricane candleholders with a bubbly texture.")

Article.create!(title: 'Blue Starfish LED Candle', category: flameless ).edits.create(editor:user, content: "This lovely Blue Starfish LED Candle features a wavy edge with an embedded starfish and will be the highlight of your shore setting. Soft warm white glow flicker and 5-hour timer feature to save the battery life.")

Article.create!(title: 'The Big Problem With Scented Candles', category: hazards, featured:true ).edits.create(editor:user, content: "Scented candles are one of the easiest and most effective ways to mask unpleasant odors in your home. But one of the main problems with scented candles is the scent itself. According to Anne Steinemann, an environmental pollutants expert who is a professor of civil engineering and the chair of sustainable cities at the University of Melbourne, certain candles may emit numerous types of potentially hazardous chemicals, such as benzene and toluene. They can cause damage to the brain, lung and central nervous system, as well as cause developmental difficulties.")

Article.create!(title: 'History of candle making', category: history ).edits.create(editor:user, content: "Candles were made by the Romans beginning about 500 BC. These were true dipped candles and made from tallow. Evidence for candles made from whale fat in China dates back to the Qin Dynasty (221–206 BC). In India, wax from boiling cinnamon was used for temple candles. In parts of Europe, the Middle-East and Africa, where lamp oil made from olives was readily available, candle making remained unknown until the early middle-ages. Candles were primarily made from tallow and beeswax in ancient times, but have been made from spermaceti, purified animal fats (stearin) and paraffin wax in recent centuries.")

Article.create!(title: 'Roman candle battle in Chicago', category: roman ).edits.create(editor:user, content: "I think it was mostly all for fun; men of all ages like playing at fighting. http://www.lennygilmore.com/photo-blog/2015/6/3/roman-candle-battle-at-western-grand-in-chicago")

Article.create!(title: 'Blueberry Bellini Candle', category: scented ).edits.create(editor:user, content: "A twist on the Italian cocktail, this mélange of ripe blueberry, lemon and champagne creates a sweet and juicy aroma!")
