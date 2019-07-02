ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  
  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    columns do
      
      column do
        panel "Total users" do
          User.count
        end
      end
      
      column do
        panel "Total Companies" do
          Company.count
        end
      end
      
      column do
        panel "Total Claims" do
          Claim.count
        end
      end
    end
  end
end
