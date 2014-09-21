ActiveAdmin.register Guest do
  permit_params :name, :email, :phone, :status, :description, category_ids: [:id]

  #Filers
  filter :name
  filter :status

  controller do
    def scoped_collection
      resource_class.includes(:time_slot) # prevents N+1 queries to your database
    end
  end

  index do
    selectable_column
    column :name
    column :email
    column :phone
    column :status
    column :time_slot_id, sortable: :time_slot_id do |guest|
      if guest.time_slot != nil
        guest.time_slot.slot.strftime("%d %b %Y %l:%M %p")
      end
    end
    actions
  end

end
