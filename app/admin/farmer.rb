ActiveAdmin.register Farmer do
  permit_params :name, :email, :phone, :status, :description

  #Filers
  filter :name
  filter :status

  index do
    selectable_column
    column :name
    column :email
    column :phone
    column :status
    actions
  end
end
