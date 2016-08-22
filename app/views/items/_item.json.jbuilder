json.extract! item, :id, :address, :email_type, :event, :time_of_event, :created_at, :updated_at
json.url item_url(item, format: :json)