json.array!(@issues) do |issue|
  json.extract! issue, :id, :title, :body
  json.url issue_url(issue, format: :json)
end
