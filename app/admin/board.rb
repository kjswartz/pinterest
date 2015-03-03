ActiveAdmin.register Board do
  config.per_page = 10
  scope :updated_board


  permit_params(:user_id, :name, :description)

  index do
    selectable_column
    column :id
    column 'Board Title' do |board|
      board.name
    end
    column :description
    column 'Pin Count' do |board|
      board.pins.count
    end
    column 'Owner' do |board|
      link_to board.user.name, admin_user_path(board.user)
    end
    actions
  end

end
