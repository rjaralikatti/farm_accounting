json.extract! transaction, :id, :reason, :location, :bill_image_path, :description, :debit_credit, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
