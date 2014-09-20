ActiveAdmin.register TimeSlot do
  permit_params :slot, category_ids: [:id]

  #Filters
  filter :slot

  index do
    selectable_column
    column :slot
    column :guest
    actions
  end

  show do
    panel "Guests" do
      table_for timeslot.guests do
        column "name" do |guest|
          guest.name
        end
      end
    end
  end

end
