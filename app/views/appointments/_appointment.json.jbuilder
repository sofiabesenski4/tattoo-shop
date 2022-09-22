json.extract! appointment, :id, :name, :start_time, :end_time, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
