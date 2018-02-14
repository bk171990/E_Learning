class Weightage < ApplicationRecord
  belongs_to :examination, optional:true
  belongs_to :question_type, optional:true
  belongs_to :placement_exam, optional:true
end
