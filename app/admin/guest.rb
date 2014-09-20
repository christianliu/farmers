ActiveAdmin.register Guest do
  permit_params :name, :email, :phone, :status, :description, category_ids: [:id]

  #Filers
  filter :name
  filter :status

  index do
    selectable_column
    column :name
    column :email
    column :phone
    column :status
    column :time_slot
    actions
  end

end
