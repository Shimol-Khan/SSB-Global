class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :body
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
