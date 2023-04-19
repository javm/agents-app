class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.string :caller_phone_number
      t.string :receiver_phone_number
      t.string :call_type
      t.datetime :start_time
      t.datetime :end_time
      t.string :agent_answer_time
      t.integer :duration

      t.references :account, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.timestamps
    end
  end
end
