json.extract! comment, :id, :user_id, :issue_id, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
