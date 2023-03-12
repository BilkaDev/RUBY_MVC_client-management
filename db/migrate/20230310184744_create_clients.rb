class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :fullname, null: false
      t.string :email , null: false, index: { unique: true}
      t.string :notes
      t.string :phone_number
      t.string :status, null: false,default: 'pending'

      t.timestamps
    end
  end
end
