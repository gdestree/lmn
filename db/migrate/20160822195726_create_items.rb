class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :address
      t.string :email_type
      t.string :event
      t.integer :time_of_event

      t.timestamps null: false
    end
  end
end
