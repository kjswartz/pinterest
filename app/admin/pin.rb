ActiveAdmin.register Pin do

  permit_params(:board_id, :title, :description, :url, :image, :image_cache, :remove_image)

  index do
    column :id
    column '' do |pin|
      image_tag pin.image.url(:thumb)
    end
    column :title
    column 'User' do |pin|
      link_to pin.board.user.name, admin_user_path(pin.board.user)
    end
    column 'Board Name' do |pin|
      link_to pin.board.name, admin_board_path(pin.board)
    end
    column :url
    actions
  end

end
