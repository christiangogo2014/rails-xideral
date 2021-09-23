json.extract! product, :id, :name, :description, :price, :remote_url, :stripe_price_id, :created_at, :updated_at
json.url product_url(product, format: :json)
