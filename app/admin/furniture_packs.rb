ActiveAdmin.register FurniturePack do

 permit_params :description, :user_id, :price, :number_of_items, :storage_conditions, :apartment_sq_footage, :apartment_number_of_bedrooms, :apartment_number_of_bathrooms, :apartment_building_name, :apartment_id
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
