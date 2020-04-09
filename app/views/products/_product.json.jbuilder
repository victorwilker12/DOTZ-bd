json.extract! product, :id, :nome, :valor_dotz, :imagem, :estoque, :created_at, :updated_at
json.url product_url(product, format: :json)
