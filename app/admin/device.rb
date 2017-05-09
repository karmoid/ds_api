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

show do
  panel "Eléments de la Playlist associée" do
    table_for device.playlist.playitems.order(:order) do
      column :page
      column :order
      column :cmd
      column :value
    end
  end
end

action_item only: %i(show) do
  link_to 'Recharge', reload_device_path(device), remote: true
end
action_item only: %i(show) do
  link_to "Stoppe", stop_device_path(device), remote: true
end
action_item only: %i(show) do
  link_to "Démarre", start_device_path(device), remote: true
end
action_item only: %i(show) do
  link_to "Rafraîchit", refresh_device_path(device), remote: true
end

sidebar "Equipement", only: [:show] do
  attributes_table_for device do
    row :name
    row :ip
    row :updated_at
    row :created_at
    row :place
    row :playlist
  end
end

end
