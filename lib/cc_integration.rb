module CCIntegration
  extend ActiveSupport::Concern

  class CCContact
    def initialize
      @cc = ConstantContact::Api.new(ENV['CC_API_KEY'], ENV['CC_OAUTH_TOKEN'])
    end

    def add_contact(contact_json)
      @cc.add_contact(contact_json)
    end

    def get_lists
      @cc.get_lists
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
      contact_list = cc.get_lists[0].id
      list_to_add_to = ConstantContact::Components::ContactList.new
      list_to_add_to.id = contact_list

      new_contact = ConstantContact::Components::Contact.new
      new_contact.add_email(ConstantContact::Components::EmailAddress.new(@contact.email_address))
      new_contact.add_list(list_to_add_to)
      new_contact.first_name = @contact.first_name
      new_contact.last_name = @contact.last_name

      cc.add_contact(new_contact).to_json
    end

    private

    def valid_contact(c)
      !c.first_name.empty? && !c.last_name.empty? && !c.email_address.empty?
    end
  end
end
