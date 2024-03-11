class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
