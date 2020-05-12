class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :content
      t.integer :wordcount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
