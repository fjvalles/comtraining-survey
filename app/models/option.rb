class Option < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :question_defaults
  has_and_belongs_to_many :answers
end
