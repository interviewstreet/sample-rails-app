json.extract! product, :id, :name, :category, :retail_price, :discounted_price, :availability, :created_at, :updated_at
json.url product_url(product, format: :json)
