json.extract! client, :id, :fullname, :email, :notes, :phone_number, :string, :created_at, :updated_at
json.url client_url(client, format: :json)
