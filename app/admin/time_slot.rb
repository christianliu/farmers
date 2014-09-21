ActiveAdmin.register TimeSlot do
  permit_params :slot
  
  #Filers
  filter :slot

  index do
    selectable_column
    column :slot
    actions
  end

end
