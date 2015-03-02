# Table name: boards
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string
#  description :text
#

# Table name: users
#  name       :string
#  username   :string
#  email      :string
#  avatar     :string
#  location   :string
#  about      :text

User.where(name: "Guest", email: "guest@guest.com").first_or_create
LOREMPIXEL = %w{abstract city animals food transport sports nightlife cats business}

5.times do |user|
  User.create(name: Faker::Name.name,
   username: Faker::Internet.user_name,
   email: Faker::Internet.safe_email,
   avatar: Faker::Avatar.image,
   location: Faker::Address.city,
   about: Faker::Lorem.paragraph)
 end

@users = User.all

@users.each do |user|
  5.times do |counter|
    Board.create(user_id: user.id,
                name: LOREMPIXEL.shuffle[0],
                description: Faker::Lorem.paragraph)
  end
end

@boards = Board.all
@boards.each do |board|
  5.times do |counter|
    Pin.create(board_id: board.id,
              title: Faker::Name.title,
              description: Faker::Lorem.paragraph,
              url: Faker::Internet.url,
              remote_image_url: "http://lorempixel.com/#{rand(520...590)}/#{rand(620...740)}/#{board.name}/")
  end
end
