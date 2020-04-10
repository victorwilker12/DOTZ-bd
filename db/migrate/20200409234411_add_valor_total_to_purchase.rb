class AddValorTotalToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :valor_total, :integer
  end
end
