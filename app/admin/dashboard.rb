ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: 'Dashboard'

  content do
    h2 'American Porphyria Foundation'

    h3 "There are #{ pluralize(Contact.count, 'contact') } in the database."

    para 'We will be adding new functions to this Dashboard in the coming months.  Keep coming back.'
  end

end
