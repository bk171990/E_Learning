json.extract! question, :id, :question, :no_of_option, :question_type_id, :created_at, :updated_at
json.url question_url(question, format: :json)
