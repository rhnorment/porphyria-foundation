class FinalDataCleanupAgain < ActiveRecord::Migration
  def change
    drop_table  :temp_contacts
  end
end
