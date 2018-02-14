json.extract! examination, :id, :exam_name, :description, :time_for_question, :total_no_of_question, :total_time_for_exam, :mark_per_question, :total_marks_of_question, :publish_exam_time_and_date, :exam_rules_and_regulations, :created_at, :updated_at
json.url examination_url(examination, format: :json)
