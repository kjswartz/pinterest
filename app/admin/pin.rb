ActiveAdmin.register Pin do
  scope_to :current_user
  scope :latest_pin

  config.per_page = 10
  permit_params(:board_id, :title, :description, :url, :image, :image_cache, :remove_image)

  index do
    column :id
    column '' do |pin|
      image_tag pin.image.url(:thumb)
    end
    column :title
    column :url
    actions
  end

end
