module CSVBuilders
  extend ActiveSupport::Concern

  module ClassMethods
    def to_email_csv
      columns = %w(first_name last_name email_address)

      CSV.generate(headers: true) do |csv|
        csv << columns

        all.each do |row|
          csv << row.attributes.values_at(*columns)
        end
      end
    end
  end

end