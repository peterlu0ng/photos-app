class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :name_string
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
