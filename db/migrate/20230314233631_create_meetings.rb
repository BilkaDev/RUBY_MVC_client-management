class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.references :user, null: false, foreign_key: true, :on_delete => :cascade
      t.references :client, null: false, foreign_key: true, :on_delete => :cascade
      t.datetime :start_time, null: false, index: { unique: true }
      t.datetime :end_time
      t.integer :confirmed, null: false, default: 0
      t.string :details

      t.timestamps
    end
  end
end
