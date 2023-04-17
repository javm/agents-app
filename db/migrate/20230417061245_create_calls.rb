class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.string :caller_phone_number
      t.string :receiver_phone_number
      t.string :duration

      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
