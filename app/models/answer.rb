class Answer < ApplicationRecord
  belongs_to :response
  belongs_to :question
  has_and_belongs_to_many :options

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

end
