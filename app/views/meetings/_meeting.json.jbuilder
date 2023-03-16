json.extract! meeting, :id, :user_id, :client_id, :start_time, :end_time, :confirmed, :details, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
