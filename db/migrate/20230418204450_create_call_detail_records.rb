class CreateCallDetailRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :call_detail_records do |t|
      t.references :account, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :agent_name
      t.timestamps
    end
  end
end
