class StudentAnswerSheet < ApplicationRecord
  belongs_to :student_exams, optional:true
  belongs_to :options, optional:true
  belongs_to :exam_questions, optional:true
end
