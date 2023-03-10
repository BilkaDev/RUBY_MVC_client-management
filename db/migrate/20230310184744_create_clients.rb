class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :fullname
      t.string :email
      t.string :notes
      t.string :phone_number
      t.string :string

      t.timestamps
    end
  end
end
