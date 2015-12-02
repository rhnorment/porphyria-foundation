module XLSBuilders
  extend ActiveSupport::Concern
  
  class ContactsSpreadsheet
  
    attr_accessor :contacts

    def initialize(contacts)
      @contacts = contacts
    end

    def generate_xls
      book = Spreadsheet::Workbook.new
      sheet = book.create_worksheet(name: 'Contacts')

      create_body(sheet)

      data_to_send = StringIO.new
      book.write(data_to_send)
      data_to_send.string
    end

    def create_body(sheet)
      # Header row with formatting:
      sheet.row(0).concat ['Full Name', 'Email Address']
      sheet.row(0).default_format = Spreadsheet::Format.new(weight: :bold)

      row_index = 1
      contacts.each do |contact|
        sheet.row(row_index).concat [contact.first_name, contact.email_address]
        
        row_index += 1
      end
    end
  end
end