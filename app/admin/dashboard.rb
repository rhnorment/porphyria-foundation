ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: 'Dashboard'

  content do
    h2 'American Porphyria Foundation'
    h3 "There are #{ pluralize(Contact.count, 'contact') } in the database."
    # h3 "There are #{ pluralize(@email_lists.count, 'list') } email lists in Constant Contact."

    columns do
      column do
        panel 'Most Recent Contacts' do
          table_for Contact.order(id: :desc).limit(10).each do |contact|
            column  :apf_member
            column  :first_name
            column  :last_name
            column  :email_address
          end
        end
      end
    end
  end

end
