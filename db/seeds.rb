# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
neighborhoods = Neighborhood.create([{name: 'West Village'}, {name: 'East Village'}, {name: 'Lower East Side'},  {name: 'Chinatown'}, {name: 'Soho'}, {name: 'Greenwich Village'}, {name: 'Gramercy & Flatiron'}, {name: 'Meatpacking District'}, {name: 'Tribeca'}, {name: 'Chelsea'}, {name: 'Financial District'}, {name: 'Midtown West'}, {name: 'Midtown East'}, {name: 'Upper East Side'}, {name: 'Upper West Side'}, {name: 'Harlem'},  {name: 'Dumbo'}, {name: 'Williamsburg'}, {name: 'Greenpoint'}, {name: 'Bushwick'}, {name: 'Prospect Heights'}, {name: 'Fort Greene'}, {name: 'Gowanus'}, {name: 'Park Slope'}, {name: 'Prospect Park'}, {name: 'Brooklyn Heights'}, {name: 'Boerum Hill'}, {name: 'Red Hook'}, {name: 'Long Island City'}, {name: 'Astoria'}, {name: 'Bronx'}])
categories = Category.create([{name: 'Musicals'}, {name: 'Comedy'}, {name: 'Drama'}, {name: 'Revival'}, {name: 'Experimental theater'}, {name: 'Interactive theater'}, {name: 'Rock, Pop, & Hip-hop'}, {name: 'Jazz & Experimental'}, {name: 'Classical & opera'},  {name: 'Cabaret & Standards'}, {name: 'Stand-up'}, {name: 'Sculpture'}, {name: 'Painting'}, {name: 'Mixed media'}, {name: 'Film & video'}, {name: 'Photography'},  {name: 'Gay & lesbian'},  {name: 'History'} ])
