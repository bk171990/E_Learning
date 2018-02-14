class StudentExam < ApplicationRecord
  belongs_to :examination
  belongs_to :student
end
