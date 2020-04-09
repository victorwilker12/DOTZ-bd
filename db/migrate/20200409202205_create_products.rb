class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :nome
      t.string :valor_dotz
      t.string :imagem
      t.string :estoque

      t.timestamps
    end
  end
end
