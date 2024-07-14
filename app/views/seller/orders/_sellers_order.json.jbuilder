json.extract! order, :id, :customer_email, :product_quantity, :total_price, :status, :shipping_address, :customer_name, :customer_phone, :created_at, :updated_at
json.url order_url(order, format: :json)
