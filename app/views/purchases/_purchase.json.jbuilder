json.extract! purchase, :id, :client_id, :product_id, :valor_do_produto, :quantidade, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
