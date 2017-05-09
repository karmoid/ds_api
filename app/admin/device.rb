ActiveAdmin.register Device do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:name, :ip, :playlist_id, :place_id]
  permitted << :uuid if params[:action] == 'create' && current_user.admin?
  permitted
end

end
