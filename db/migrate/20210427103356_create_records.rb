class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :client_name
      t.string :client_email
      t.string :client_contact
      t.string :client_address
      t.string :service
      t.string :status, default: 'In Processing'
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
