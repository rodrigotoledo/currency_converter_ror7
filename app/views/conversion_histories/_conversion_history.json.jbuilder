json.extract! conversion_history, :id, :from, :to, :amount, :result, :created_at, :updated_at
json.url conversion_history_url(conversion_history, format: :json)
