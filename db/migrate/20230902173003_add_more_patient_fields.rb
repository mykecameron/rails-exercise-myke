class AddMorePatientFields < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :avatar_url, :string
    add_column :patients, :sicklie_updated_at, :datetime
  end
end
