namespace :convert_to_currency do
  desc 'change gift amount from string to currency'

  task gift_amount: :environment do
    conversion_count = 0
    contacts = Contact.all
    
    contacts.each do |contact|
      begin
        string_to_convert = contact.temp_gift_amount.to_f
        contact.update(gift_amount: string_to_convert)
        conversion_count += 1
      rescue Exception => e
        puts "#{contact.id} failed"
      end
    end
    
    puts "#{conversion_count} donations converted to currency format."
  end
  
end
