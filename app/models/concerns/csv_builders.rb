module CSVBuilders
  extend ActiveSupport::Concern

  module ClassMethods
    def to_email_csv
      columns = %w(full_name email_address)

      CSV.generate(headers: true) do |csv|
        csv << columns

        with_email_addresses.each do |row|
          csv << [row.full_name, row.email_address]
        end
      end
    end
  end

  def full_name
    [first_name, last_name].join(' ')
  end

end