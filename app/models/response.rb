class Response < ApplicationRecord
  belongs_to :survey, counter_cache: true
  belongs_to :user
  has_many :answers
  has_many :employees

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

end
