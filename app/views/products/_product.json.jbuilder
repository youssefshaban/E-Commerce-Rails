json.extract! product, :id, :name, :quantity, :currentPrice, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
