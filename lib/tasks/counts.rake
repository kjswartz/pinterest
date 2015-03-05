namespace :db do
  desc "Generate counts for users, boards, and pins"
  task :counts => :environment do
    puts "Total Users: #{User.count}"
    puts "Total Boards: #{Board.count}"
    puts "Total Pins: #{Pin.count}"
    puts ''
    puts "Detailed Count"
    User.all.each do |user|
      puts "User: #{user.name}; Boards: #{user.boards.count}; Pins: #{user.pins.count}"
    end
  end
end
