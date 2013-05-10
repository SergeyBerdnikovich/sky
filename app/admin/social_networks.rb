ActiveAdmin.register SocialNetwork do
  form do |f|
    f.inputs "Icon" do
      f.input :name
      f.input :link
      f.input :icon, :as => :file, :hint => f.template.image_tag(f.object.icon.url)
    end
    f.actions
  end
end