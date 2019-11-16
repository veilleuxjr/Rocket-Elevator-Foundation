json.extract! client, :id, :first_name, :last_name, :age, :email, :phone_number, :created_at, :updated_at
json.url client_url(client, format: :json)
