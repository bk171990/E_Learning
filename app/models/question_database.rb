class QuestionDatabase < ApplicationRecord
  belongs_to :exam_question
  has_many :options


  def self.create_que(options, que, answer)
    options.each_pair do|k, v|
      if answer.include? k
        ans = true
      else
        ans = false
      end
      Option.create(question_database_id: que.id, option: v, is_answer: ans)
    end
  end
end
