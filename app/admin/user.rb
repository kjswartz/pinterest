ActiveAdmin.register User do

  permit_params(:name, :username, :email, :avatar, :avatar_cache, :location, :about, :remove_avatar)

  form do |f|
    inputs '' do
      input :name
      input :username
      input :email
      input :avatar
      input :location
      input :about
    end
    actions
  end

  index do
    column :id
    column "Profile Pic" do |user|
      image_tag user.avatar.url(:thumb)
    end
    column :name
    column :username
    column :email
    column :location
    column "Boards" do |user|
      user.boards.count
    end
    column "Pins" do |user|
      user.pins.count
    end
    actions
  end

end
