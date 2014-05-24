json.array!(@questions) do |question|
  json.extract! question, :id, :title, :text, :end_date, :start_date
  json.url question_url(question, format: :json)
end
