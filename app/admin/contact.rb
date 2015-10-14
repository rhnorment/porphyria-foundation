ActiveAdmin.register Contact do

  menu priority: 2

  config.sort_order = 'last_name_asc'

  filter    :apf_member
  filter    :city
  filter    :first_name
  filter    :last_name
  filter    :state
  filter    :porphyria_type

  scope     :all, default: true
  scope     :members
  scope     :non_members

  index do
    selectable_column
    id_column
    column  :apf_member
    column  :first_name
    column  :last_name
    column  :home_phone
    column 'Email' do |contact|
      mail_to contact.email_address, contact.email_address if contact.email_address.present?
    end
    actions dropdown: true
  end

  show do
    attributes_table do
      row   :full_name
      row   :birthday

      row   :company
      row   :address_1
      row   :address_2
      row   :city_state_zip
      row   :country

      row   :home_phone
      row   :business_phone
      row   :cell_phone
      row 'Email Address' do |contact|
        mail_to contact.email_address, contact.email_address
      end
      row   :miscellaneous
    end
    active_admin_comments
  end

  sidebar 'APF Attributes', only: :show do
    attributes_table do
      row   :apf_member
      row   :cme
      row   :doctor_packet_sent
      row   :doctor_packet_sent_on
      row   :doctor_specialty
      row   :gift_amount
      row   :gift_given_on
      row   :media
      row   :patient_packet_sent
      row   :patient_packet_sent_on
      row   :porphyria_type
      row   :research
      row   :status
      row   :waived
    end
  end

end