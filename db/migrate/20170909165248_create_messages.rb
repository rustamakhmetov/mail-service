class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title, null: false, default: ""
      t.text :text

      t.timestamps
    end
    add_index :messages, :title, unique: true
  end
end
