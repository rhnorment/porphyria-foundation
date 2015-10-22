namespace :change_date_data do
  desc 'Change gift_given_on to DATE function'
  task gift_given_on: :environment do
    counter = 0

    Contact.all.each do |contact|
      if needs_to_change?(contact, 'temp_gift_given_on')
        begin
          contact.update(gift_given_on: Date.parse(string_to_parse(date_array(contact, 'temp_gift_given_on'))))
        rescue Exception => e
          puts "#{contact.id} failed"
          puts "#{e.class}: #{e.message}"
        end
        counter += 1 unless e
      end
    end

    puts "Updated #{counter} contacts"
  end

  desc 'Change doctor_packet_sent_on to DATE function'
  task doctor_packet_sent_on: :environment do
    counter = 0

    Contact.all.each do |contact|
      if needs_to_change?(contact, 'temp_doctor_packet_sent_on')
        begin
          contact.update(doctor_packet_sent_on: Date.parse(string_to_parse(date_array(contact, 'temp_doctor_packet_sent_on'))))
        rescue Exception => e
          puts "#{contact.id} failed"
          puts "#{e.class}: #{e.message}"
        end
        counter += 1 unless e
      end
    end

    puts "Updated #{counter} contacts"
  end

  desc 'Change patient_packet_sen_on to DATE function'
  task patient_packet_sent_on: :environment do
    counter = 0

    Contact.all.each do |contact|
      if needs_to_change?(contact, 'temp_patient_packet_sent_on')
        begin
          contact.update(patient_packet_sent_on: Date.parse(string_to_parse(date_array(contact, 'temp_patient_packet_sent_on'))))
        rescue Exception => e
          puts "#{contact.id} failed"
          puts "#{e.class}: #{e.message}"
        end
        counter += 1 unless e
      end
    end

    puts "Updated #{counter} contacts"
  end
end

def needs_to_change?(contact, attribute)
  !contact[attribute.to_sym].blank?
end

def date_array(contact, attribute)
  contact[attribute.to_sym].split('/')
end

def string_to_parse(date_array)
  date_array[2] + date_array[0] + date_array[1]
end