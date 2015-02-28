# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

LOREMPIXEL = %w{abstract city animals food transport sports nightlife cats business}
10.times do |counter|
  Pin.create(board_id: "7",
            title: Faker::Name.title,
            description: Faker::Lorem.paragraph,
            url: Faker::Internet.url,
            remote_image_url: "http://lorempixel.com/#{rand(540...580)}/#{rand(640...680)}/#{LOREMPIXEL.shuffle[0]}/")
end
