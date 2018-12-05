# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://www.lyon-france.com/Je-decouvre-Lyon/activites-loisirs-et-bien-etre/Parcs-jardins-et-lieux-de-balade"))
@taburl = []
@tabtitle = []

doc.css('.header-text-one a @title').each do |title| @tabtitle << title.text end
doc.css('.list_offres .card-list-horizontal-content .col-xs-12 a img @src').each do |url| @taburl << url.text end
@tablatitude = [45.777411, 45.782929, 45.773373, 45.775568, 49.252947, 45.780971]
@tablongitude = [4.855225, 4.852306, 4.854822, 4.858500, 4.030319, 4.832410]

10.times do |y|
    @places = Place.create(name: @tabtitle[y], image_url: @taburl[y], latitude: @tablatitude[y], longitude: @tablongitude[y])
end

# Place.create!([
# { "name": "Buckingham Palace", "latitude": "51.501564","longitude": "-0.141944"},
# { "name": "Westminster Abbey", "latitude": "51.499581", "longitude": "-0.127309"},
# { "name": "Big Ben", "latitude": "51.500792", "longitude": "-0.124613"}
# ])
