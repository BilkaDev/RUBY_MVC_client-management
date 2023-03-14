class AddUserRefToClients < ActiveRecord::Migration[7.0]
  def change
    add_reference :clients, :user, foreign_key: true
  end
end
