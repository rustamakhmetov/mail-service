class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :email, null: false, default: ""
      t.string :name, null: false, default: ""
      t.float :balance, null: false, default: 0
      t.string :currency, null: false, default: ""

      t.timestamps
    end
    add_index :accounts, :email, unique: true
  end
end
