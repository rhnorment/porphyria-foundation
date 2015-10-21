require 'rails_helper'

describe 'import_data:contacts' do
  include_context 'rake'

  it 'imports 28 records into the database' do
    subject.invoke
    expect(Contact.all.count).to eql(28)
  end
end

describe 'import_data:change_all_dates' do
  include_context 'rake'

end


