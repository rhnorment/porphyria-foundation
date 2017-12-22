module CSVBuilders
  extend ActiveSupport::Concern

  module ClassMethods
    def for_mail_csv
      columns = %w(name_for_email email_address)

      CSV.generate(headers: true) do |csv|
        csv << columns

        with_email_addresses.each do |row|
          csv << [row.name_for_email, row.email_address]
        end
      end
    end

    def for_email_csv
      columns = %w(first_name last_name email_address)

      CSV.generate(headers: true) do |csv|
        csv << columns

        with_email_addresses.each do |row|
          csv << [row.first_name, row.last_name, row.email_address]
        end
      end
    end
  end

  def name_for_email
    [first_name, last_name].join(' ')
  end

end