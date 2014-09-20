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
    column "Time Slot", :sortable => :time_slot do |guest|
      if guest.time_slot != nil
        guest.time_slot.slot.strftime("%d %b %Y %l:%M %p")
      end
    end
    actions
  end

end
