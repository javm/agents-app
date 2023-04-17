class CreateCallDetailRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :call_detail_records do |t|

      t.timestamps
    end
  end
end
