class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :username
      t.references :dialect, foreign_key: true

      t.timestamps
    end
  end
end
