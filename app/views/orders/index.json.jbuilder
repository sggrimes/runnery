json.array!(@orders) do |order|
  json.extract! order, :id, :address, :phone, :surcharge, :user_id, :pay_type, :taken, :receipt, :done, :redeemed
  json.url order_url(order, format: :json)
end
