class Examination < ApplicationRecord
	has_many :exam_questions
  accepts_nested_attributes_for :exam_questions, allow_destroy: true
  has_many :weightages
  scope :load, ->(id) { where(id: id).take }

   def self.calculateres(test, exam, student)
    final_res = []
    question_types = []
    tot_question_types = []
    StudentExam.create(examination_id: exam,
                       student_id: student.id)
    student_exam = StudentExam.where(student_id: student).take
    i = 0
    test.each do |key, value|
      StudentAnswerSheet.create(student_exams_id: student_exam.id,
                                exam_questions_id: key,
                                options_id: value)
        ans = Option.where(exam_question_id: key.to_i, id: value.to_i).take

      if ans.is_answer == 't'
        i += 1
        question_types << ans.exam_question
    end
  end
   result = Examination.tot_per(question_types, exam)
    final_res << result
    StudentScore.create(examination_id: exam,
                        student_id: student.id, score: i.to_f)
    score = StudentScore.where(student_id: student.id,
                               examination_id: exam).take
    final_res << score.score
    final_res
  end

  # percentage
  def self.tot_per(question_types, exam)
    
    result = []
    types = Weightage.where(examination_id: exam)
    types.each do |r|
     
      total = r.examination.total_marks_of_question.to_f
      ans = question_types.length.to_f
      if total == 0
        per = 0
      else
        per = ((ans*2) * 100 / total)
      end
      result << [r.examination.exam_name, per]
    end
    result
  end
end