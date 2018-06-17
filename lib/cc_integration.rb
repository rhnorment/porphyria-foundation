module CCIntegration
  extend ActiveSupport::Concern

  class CCContact
    def initialize
      @cc = ConstantContact::Api.new(ENV['CC_API_KEY'], ENV['CC_OAUTH_TOKEN'])
    end

    def add_contact(contact_json)
      @cc.add_contact(contact_json)
    end

    def get_list(list_id)
      @cc.get_list(list_id)
    end
  end

  class AddContactToCC
    attr_reader :contact

    def initialize(contact)
      @contact = contact
    end

    def add_to_cc
      return unless valid_contact(@contact)

      cc = CCContact.new

      new_contact = ConstantContact::Components::Contact.new
      new_contact.add_email(ConstantContact::Components::EmailAddress.new(@contact.email_address))
      new_contact.add_list(get_list_id(@contact)).id
      new_contact.first_name = @contact.first_name
      new_contact.last_name = @contact.last_name

      cc.add_contact(new_contact).to_json
    end

    private

    def valid_contact(c)
      !c.first_name.empty? && !c.last_name.empty? && !c.email_address.empty?
    end

    def get_list_id(c)
      case c.porphyria_type
      when 'EPP'
        1956569763
      when 'AIP'
        1264276246
      when 'HCP'
        1496488488
      when 'VP'
        1598671601
      when 'CEP'
        1223815697
      when 'PCT'
        1331113000
      when 'HEP'
        1398729893
      when 'ADP'
        1586419189
      else
        1048140845
      end
    end
  end
end
