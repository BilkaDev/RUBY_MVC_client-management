json.extract! client, :id, :fullname, :email, :notes, :phone_number, :status, :created_at, :updated_at
json.url client_url(client, format: :json)
