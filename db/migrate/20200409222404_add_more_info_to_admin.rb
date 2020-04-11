class AddMoreInfoToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :nome, :string
    add_column :admins, :compensador_dotz, :integer
    add_reference :admins, :client, foreign_key: true
    add_reference :admins, :product, foreign_key: true
  end
end
