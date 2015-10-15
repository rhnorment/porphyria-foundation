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

# CONTROLLER ======================================================================
  controller do
    def apply_pagination(chain)
      chain = super unless formats.include?([:csv, :xml, :json])
      chain
    end
  end

# FORM ============================================================================
  form do |f|
    f.semantic_errors

    tabs do
      tab 'Basic Information' do
        f.inputs 'Name' do
          f.input   :name_prefix
          f.input   :first_name
          f.input   :middle_name
          f.input   :last_name
          f.input   :name_suffix
        end

        f.inputs 'Address Information' do
          f.input   :company
          f.input   :address_1
          f.input   :address_2
          f.input   :city
          f.input   :state
          f.input   :zip_code
          f.input   :country, as: :string
        end

        f.inputs 'Contact Information' do
          f.input   :home_phone
          f.input   :business_phone
          f.input   :cell_phone
          f.input   :email_address
        end
      end

      tab 'APF Information' do
        f.inputs do
          f.input   :apf_member, as: :radio, collection: Contact::YES_NO
          f.input   :cme, as: :radio, collection: Contact::YES_NO
          f.input   :doctor_packet_sent, as: :radio, collection: Contact::YES_NO
          f.input   :doctor_packet_sent_on
          f.input   :doctor_specialty
          f.input   :gift_amount
          f.input   :gift_given_on
          f.input   :media
          f.input   :miscellaneous
          f.input   :patient_packet_sent, as: :radio, collection: Contact::YES_NO
          f.input   :patient_packet_sent_on
          f.input   :porphyria_type, as: :select, collection: Contact::PORPHYRIA_TYPES
          f.input   :research
          f.input   :status
          f.input   :waived, as: :radio, collection: Contact::YES_NO
        end
      end
    end

    f.actions
  end

# INDEX =============================================================================
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
    actions dropdown: true, defaults: false do |contact|
      item 'View', admin_contact_path(contact)
      item 'Edit', edit_admin_contact_path(contact)
      item 'Print label (coming soon)', 'javascript:void(0'
      item 'Delete', admin_contact_path(contact), method: :delete, data: { confirm: 'Are you sure?'' '}
    end
  end

# SHOW =============================================================================
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

# SIDEBAR =============================================================================
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

  sidebar 'Recent Donations', only: :show do

  end

# PRIVATE =============================================================================
  permit_params   :address_1, :address_2, :apf_member, :birth_day, :birth_month, :birth_year,
                  :business_phone, :cell_phone, :city, :cme, :company, :country, :date_of_birth,
                  :doctor_packet_sent, :doctor_packet_sent_on, :doctor_specialty, :email_address,
                  :fax_number, :first_name, :gift_amount, :gift_given_on, :home_phone, :last_name,
                  :media, :middle_name, :miscellaneous, :name_prefix, :name_suffix, :patient_packet_sent,
                  :patient_packet_sent_on, :porphyria_type, :research, :state, :status, :waived, :zip_code

  csv do
    column  :full_name
    column  :company
    column  :address_1
    column  :address_2
    column  :city_state_zip
    column  :country
  end

end