# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
neighborhoods = Neighborhood.create([{name: 'West Village'}, {name: 'East Village'}, {name: 'Midtown West'}, {name: 'Midtown East'}, {name: 'Chelsea'}, {name: 'Chinatown'}, {name: 'Financial District'} ])
categories = Category.create([{name: 'Comedy'}, {name: 'Sculpture'}, {name: 'Musicals'}, {name: 'Painting'}, {name: 'Experimental theatre'}])
