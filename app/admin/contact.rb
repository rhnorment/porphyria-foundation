# == Schema Information
#
# Table name: contacts
#
#  id                     :integer          not null, primary key
#  address_1              :string           default("")
#  address_2              :string           default("")
#  business_phone         :string           default("")
#  cell_phone             :string           default("")
#  city                   :string           default("")
#  cme                    :string           default("")
#  company                :string           default("")
#  country                :string           default("")
#  doctor_packet_sent     :string           default("")
#  doctor_specialty       :string           default("")
#  email_address          :string           default("")
#  fax_number             :string           default("")
#  first_name             :string           default("")
#  home_phone             :string           default("")
#  last_name              :string           default("")
#  middle_name            :string           default("")
#  miscellaneous          :text             default("")
#  name_prefix            :string           default("")
#  name_suffix            :string           default("")
#  patient_packet_sent    :string           default("")
#  porphyria_type         :string           default("")
#  state                  :string           default("")
#  status                 :string           default("")
#  waived                 :string           default("")
#  zip_code               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  date_of_birth          :date
#  gift_given_on          :date
#  doctor_packet_sent_on  :date
#  patient_packet_sent_on :date
#  research               :boolean          default(FALSE)
#  gift_amount            :decimal(8, 2)
#  keep                   :boolean          default(FALSE)
#

ActiveAdmin.register Contact do

  menu priority: 2

# ACTION ITEMS ======================================================================
  action_item :new, only: :show do
    link_to 'Add New Contact', new_admin_contact_path
  end

  action_item :export_for_mail, only: :index do
    link_to 'Export for Mail', export_for_mail_admin_contacts_path
  end

  action_item :export_for_email, only: :index do
    link_to 'Export for Email', export_for_email_admin_contacts_path
  end

# CONTROLLER ======================================================================
  controller do
    def index
      index! do |format|
        format.csv { super }
        format.json { super }
        
        format.xls {
          spreadsheet = XLSBuilders::ContactsSpreadsheet.new(@contacts)
          send_data spreadsheet.generate_xls, filename: 'contacts.xls'
        }
      end

      def create
        super

        if @contact.email_address
          new_contact = CCIntegration::AddContactToCC.new(@contact)
          new_contact.add_to_cc
        end
      end
    end
    
    def apply_pagination(chain)
      chain = super unless formats.include?(:csv) || formats.include?(:json) || formats.include?(:xls)
      chain
    end
  end

  collection_action :export_for_mail, method: :get do
    export =  Contact.with_email_addresses
    send_data export.for_mail_csv, filename: "mail-#{Date.today}.csv"
  end

  collection_action :export_for_email, method: :get do
    export = Contact.with_email_addresses
    send_data export.for_email_csv, filename: "email-#{Date.today}.csv"
  end

# FORM ============================================================================
  form do |f|
    f.semantic_errors

    tabs do
      tab 'Personal Information' do
        f.inputs 'Personal Information' do
          f.input   :name_prefix
          f.input   :first_name
          f.input   :middle_name
          f.input   :last_name
          f.input   :name_suffix
          f.input   :date_of_birth, order: [:month, :day, :year], start_year: Date.today.year - 70,
                    end_year: Date.today.year
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
          f.input   :fax_number
          f.input   :email_address
        end
      end

      tab 'APF Information' do
        f.inputs do
          f.input   :cme, as: :radio, collection: Contact::YES_NO
          f.input   :doctor_packet_sent, as: :radio, collection: Contact::YES_NO
          f.input   :doctor_packet_sent_on, order: [:month, :day, :year], start_year: Date.today.year - 10, end_year: Date.today.year + 5
          f.input   :doctor_specialty
          f.input   :gift_amount
          f.input   :gift_given_on, order: [:month, :day, :year], start_year: Date.today.year - 10, end_year: Date.today.year + 5
          f.input   :keep, label: 'Keep?'
          f.input   :miscellaneous
          f.input   :patient_packet_sent, as: :radio, collection: Contact::YES_NO
          f.input   :patient_packet_sent_on, order: [:month, :day, :year], start_year: Date.today.year - 10, end_year: Date.today.year + 5
          f.input   :porphyria_type, as: :select, collection: Contact::PORPHYRIA_TYPES
          f.input   :research, as: :radio
          f.input   :status
          f.input   :waived, as: :radio, collection: Contact::YES_NO
        end
      end
    end

    f.actions
  end

# INDEX =============================================================================
  config.sort_order = 'last_name_asc'

  filter    :first_name
  filter    :last_name
  filter    :company
  filter    :city
  filter    :state
  filter    :zip_code
  filter    :country
  filter    :status
  filter    :porphyria_type, as: :select, collection: Contact::PORPHYRIA_TYPES
  filter    :gift_amount, as: :numeric_range
  filter    :gift_given_on
  filter    :doctor_packet_sent_on
  filter    :patient_packet_sent_on
  filter    :created_at, label: 'Member Since'
  filter    :keep

  index do
    selectable_column
    id_column
    column  :first_name
    column  :last_name
    column  :business_phone
    column  :city
    column  :state
    column  :status
    actions dropdown: true, defaults: false do |contact|
      item 'View', admin_contact_path(contact)
      item 'Edit', edit_admin_contact_path(contact)
      item 'Print label (coming soon)', 'javascript:void(0)'
      item 'Delete', admin_contact_path(contact), method: :delete, data: { confirm: 'Are you sure?'' '}
    end
  end

  scope   :all, default: true
  scope   :international_members
  scope   :with_email_addresses

# SHOW =============================================================================
  show do
    attributes_table do
      row   :full_name do |contact|
        [contact.name_prefix, contact.first_name, contact.middle_name, contact.last_name, contact.name_suffix].join(' ')
      end
      row   :date_of_birth
      row   :company
      row   :address_1
      row   :address_2
      row   :city_state_zip do |contact|
        [contact.city, contact.state, contact.zip_code].join(' ')
      end
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
      row('Member since') { contact.created_at }
      row   :cme
      row   :doctor_packet_sent
      row   :doctor_packet_sent_on
      row   :doctor_specialty
      row('Gift Amount') { number_to_currency(contact.gift_amount) }   
      row   :gift_given_on
      row   :keep
      row   :patient_packet_sent
      row   :patient_packet_sent_on
      row   :porphyria_type
      row   :research
      row   :status
      row   :waived
    end
  end

# PRIVATE =============================================================================
  permit_params   :address_1, :address_2, :business_phone, :cell_phone, :city, :cme, :company, :country,
                  :date_of_birth, :doctor_packet_sent, :doctor_packet_sent_on, :doctor_specialty, :email_address,
                  :fax_number, :first_name, :gift_amount, :gift_given_on, :home_phone, :keep, :last_name, 
                  :middle_name, :miscellaneous, :name_prefix, :name_suffix, :patient_packet_sent,
                  :patient_packet_sent_on, :porphyria_type, :research, :state, :status, :waived, :zip_code

  csv do
    column :first_name
    column :last_name
    column :email_address
  end

end
