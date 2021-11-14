class Company < ApplicationRecord
  has_many :surveys

  has_one_attached :logo do |attachable|
    attachable.variant :medium, resize: "300x300>"
  end

  validates :name, presence: true
end
