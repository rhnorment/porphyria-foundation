module CSVBuilders
  extend ActiveSupport::Concern

  module ClassMethods
    def to_email_csv
      columns = %w(name_for_email email_address)

      CSV.generate(headers: true) do |csv|
        csv << columns

        with_email_addresses.each do |row|
          csv << [row.name_for_email, row.email_address]
        end
      end
    end
  end

  def name_for_email
    [first_name, last_name].join(' ')
  end

end