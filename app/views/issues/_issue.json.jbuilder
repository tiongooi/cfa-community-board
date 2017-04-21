json.extract! issue, :id, :user_id, :title, :content, :receipt, :created_at, :updated_at
json.url issue_url(issue, format: :json)
