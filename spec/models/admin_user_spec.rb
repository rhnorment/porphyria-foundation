# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  bio                    :text             default("")
#

require 'rails_helper'

RSpec.describe AdminUser, type: :model do

  let(:resource_class)  { 'AdminUser' }
  let(:all_resources)   { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)        { all_resources[resource_class] }

  it 'has a valid resource name' do
    expect(resource.resource_name).to eql('AdminUser')
  end

  it 'should display in the menu bar' do
    expect(resource).to be_include_in_menu
  end

  it 'has the default set of CRUD actions available to it' do
    expect(resource.defined_actions).to include(:index, :show, :new, :create, :edit, :update, :destroy)
  end

  it 'has a valid factory' do
    expect(AdminUser.new(admin_user_attributes)).to be_valid
  end

  it { should have_db_column(:bio).of_type(:text) }
  it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:current_sign_in_ip).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:encrypted_password).of_type(:string) }
  it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:last_sign_in_ip).of_type(:string) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:reset_password_token).of_type(:string) }
  it { should have_db_column(:remember_created_at).of_type(:datetime) }
  it { should have_db_column(:sign_in_count).of_type(:integer) }

  it { should have_db_index(:email).unique }
  it { should have_db_index(:reset_password_token).unique }

  it { should have_many(:posts) }

  it { should respond_to(:bio) }
  it { should respond_to(:current_sign_in_at) }
  it { should respond_to(:current_sign_in_ip) }
  it { should respond_to(:email) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:last_sign_in_at) }
  it { should respond_to(:last_sign_in_ip) }
  it { should respond_to(:name) }
  it { should respond_to(:reset_password_token) }
  it { should respond_to(:remember_created_at) }
  it { should respond_to(:sign_in_count) }
end
