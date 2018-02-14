class ExamQuestion < ApplicationRecord
	has_many :exam_answers, inverse_of: :exam_question
  has_many :options
  belongs_to :examination
	accepts_nested_attributes_for :exam_answers, reject_if: proc { |attributes| attributes[:name].blank? },  allow_destroy: true

	def self.create_que(options, que, answer)
      options.each_pair do|k, v|
       if answer.include? k
         ans = true
        else
         ans = false
       end
        Option.create!(exam_question_id: que.id, option: v, is_answer: ans)
      end
    end
end

