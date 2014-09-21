ActiveAdmin.register Guest do
  permit_params :name, :email, :phone, :status, :description, category_ids: [:id]

  action_item do
      link_to "Send Confirmation Emails", "/"
  end

  action_item do
      link_to "Send Reschedule Emails", "/"
  end
  
  action_item do
      link_to "Send Reminder Emails", "/"
  end

  batch_action :approve do |selection|
      Guest.find(selection).each do |guest|
        guest.status = "Approved"
        guest.save
      end
      redirect_to :back
  end

  batch_action :deny do |selection|
      Guest.find(selection).each do |guest|
        guest.status = "Denied"
        guest.save
      end
      redirect_to :back
  end

  batch_action :undecide do |selection|
      Guest.find(selection).each do |guest|
        guest.status = ""
        guest.save
      end
      redirect_to :back
  end

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
    column :status
    column :time_slot_id, sortable: :time_slot_id do |guest|
      if guest.time_slot != nil
        guest.time_slot.slot.strftime("%d %b %Y %l:%M %p")
      end
    end
    column :name
    column :email
    column :phone
    actions
  end

end
