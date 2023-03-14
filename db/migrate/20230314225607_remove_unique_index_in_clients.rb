class RemoveUniqueIndexInClients < ActiveRecord::Migration[7.0]
  def change
    remove_index :clients, :email
  end
end
