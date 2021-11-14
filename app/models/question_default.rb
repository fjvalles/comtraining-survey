class QuestionDefault < ApplicationRecord
  belongs_to :survey
  has_and_belongs_to_many :options

  validates :q_type, uniqueness: { scope: :survey_id }

  enum q_type: [:n2, :n4, :n5, :n6, :n8]

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
end
