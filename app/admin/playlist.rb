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
  panel "Détail de la playlist" do
    attributes_table_for playlist do
      row :name
      row :note
      row :updated_at
      row :created_at
    end
  end
  panel "Pages liés" do
    table_for playlist.playitems.order(:order) do
      column :page
      column :order
      column :cmd
      column :value
    end
  end
end

end
