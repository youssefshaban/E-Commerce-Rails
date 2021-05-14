json.extract! cart, :id, :buyer_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)
