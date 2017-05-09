ActiveAdmin.register Place do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:name, :geoloc]
  permitted
end

# show do
#   panel "Détail de l'emplacement" do
#     attributes_table_for place do
#       row :name
#       row :geoloc
#       row :updated_at
#       row :created_at
#     end
#   end
#   attributes_table_for place do
#     row "Places" do |pl|
#       pl.devices.each.map do |device|
#         link_to(device.name, admin_device_path(device))
#       end.join(', ').html_safe
#     end
#   end
#   panel "Equipements associées" do
#     table_for place.devices do |pl|
#       column :name
#       column :action do
#         link_to :view, admin_device_path(device)
#       end
#       column :ip
#       column :uuid
#     end
#   end
# end

show do
  panel "Equipements" do
    table_for place.devices do
      column("Name") {|device| link_to(device.name, admin_device_path(device))}
      column :id
      column :ip
      column :uuid
      column ("Edit") {|device| link_to("Edit", edit_admin_device_path(device))}
    end
  end
end
sidebar "Emplacement", only: [:show] do
  attributes_table_for place do
    row :name
    row :geoloc
    row :updated_at
    row :created_at
  end
end

end
