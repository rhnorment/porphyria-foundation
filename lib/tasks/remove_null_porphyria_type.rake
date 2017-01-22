namespace :remove_null_porphyria_type do
  desc 'collect all record with null porphyria type'
  task collect_records: :environment do
    contacts_to_change = Contact.where('porphyria_type IS NULL OR porphyria_type = ?', '')

    puts 'Found ' + contacts_to_change.size.to_s + ' contacts'
  end

  desc 'Make changes to collected records'
  task make_changes: :environment do
    contacts_to_change = Contact.where('porphyria_type IS NULL OR porphyria_type = ?', '')

    counter = 0
    contacts_to_change.each do |contact|
      contact.update(porphyria_type: 'None')
      counter += 1
    end

    puts 'Changed ' + counter.to_s + ' contacts'
  end
end