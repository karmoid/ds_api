ActiveAdmin.register Playlist do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:name, :note]
  permitted
end

show do
  panel "Pages liés" do
    table_for playlist.playitems.order(:order) do
      column :page
      column :order
      column :cmd
      column :value
    end
  end
  panel "Equipement liés" do
    table_for playlist.devices do
      column("Name") {|device| link_to(device.name, admin_device_path(device))}
      column :id
      column :ip
      column :uuid
      column ("Edit") {|device| link_to("Edit", edit_admin_device_path(device))}
    end
  end
end

sidebar "Playlist", only: [:show] do
  attributes_table_for playlist do
    row :name
    row :note
    row :updated_at
    row :created_at
  end
end

end
