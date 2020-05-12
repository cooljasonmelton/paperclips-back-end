class CreatePrompts < ActiveRecord::Migration[6.0]
  def change
    create_table :prompts do |t|
      t.string :title
      t.text :content
      t.string :img

      t.timestamps
    end
  end
end
