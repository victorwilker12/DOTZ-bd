class AddMoreInfoToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :nome, :string
    add_column :clients, :cpf, :string
    add_column :clients, :saldo_dotz, :integer, default: 0
  end
end
