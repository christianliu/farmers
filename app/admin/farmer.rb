ActiveAdmin.register Farmer do
  permit_params :name, :email, :phone, :status, :description

  action_item do
      link_to "Send Reminder Emails", "/"
  end

  batch_action :approve do |selection|
      Farmer.find(selection).each do |farmer|
        farmer.status = "Approved"
        farmer.save
      end
      redirect_to :back
  end

  batch_action :deny do |selection|
      Farmer.find(selection).each do |farmer|
        farmer.status = "Denied"
        farmer.save
      end
      redirect_to :back
  end

  #Filers
  filter :name
  filter :status

  index do
    selectable_column
    column :status
    column :name
    column :email
    column :phone
    actions
  end
end
