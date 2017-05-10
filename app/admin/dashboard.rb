ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    panel "5 derniers équipements" do
      columns do
        column do
          span "Nom"
        end
        column do
          span "Identifiant unique"
        end
        column do
          span "Dernière adresse IP"
        end
        column do
          span "Dernière maj"
        end
      end
      Device.all.order("updated_at desc").limit(5).map do |device|
        columns do
          column do
            span link_to(device.name, admin_device_path(device))
          end
          column do
            span "#{device.uuid}"
          end
          column do
            span "#{device.ip}"
          end
          column do
            span "#{device.updated_at}"
          end
          column do
            span link_to "Etat",  status_device_path(device), target: :blank
          end
        end
      end
    end

    panel "Equipements en lecture par défaut" do
      columns do
        column do
          span "Nom"
        end
        column do
          span "Identifiant unique"
        end
        column do
          span "Dernière adresse IP"
        end
        column do
          span "Dernière maj"
        end
      end
      Device.joins(:playlist).where(playlists: {name: "default"}).order("updated_at desc").map do |device|
        columns do
          column do
            span link_to(device.name, admin_device_path(device))
          end
          column do
            span "#{device.uuid}"
          end
          column do
            span "#{device.ip}"
          end
          column do
            span "#{device.updated_at}"
          end
          column do
            span link_to "Etat",  status_device_path(device), target: :blank
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
