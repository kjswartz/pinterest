ActiveAdmin.register Board do
  config.per_page = 10

  permit_params(:user_id, :name, :description)

  index do
    selectable_column
    column :id
    column 'Board Title' do |board|
      board.name
    end
    column :description
    column 'Pin Count' do |board|
      link_to board.pins.count, admin_pins_path(q: {board_id_eq: board.id})
    end
    column 'Owner' do |board|
      link_to board.user.name, admin_user_path(board.user)
    end
    actions
  end

end
