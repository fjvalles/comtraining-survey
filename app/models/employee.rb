class Employee < ApplicationRecord
  belongs_to :survey
  belongs_to :response
  belongs_to :evaluator, class_name: 'Employee'
  has_many :subordinates, class_name: 'Employee', foreign_key: 'evaluator_id'

  accepts_nested_attributes_for :subordinates, reject_if: :all_blank, allow_destroy: true

  has_one_attached :avatar do |attachable|
    attachable.variant :medium, resize: "300x300>"
  end

  def full_name
    first_name + ' ' + last_name
  end
end
