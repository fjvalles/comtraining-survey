class Question < ApplicationRecord
  belongs_to :survey
  belongs_to :proficiency
  has_many :answers, dependent: :destroy
  has_many :options, dependent: :destroy

  enum q_type: [:vradio, :hradio, :text, :demo]
  enum scale: [:n1, :n2, :n3, :n4, :n5]

  validates :title, :q_type, presence: true

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  # before_save :check_scale

  def check_scale
    puts '??? - CHECK SCALE'
    self.options.destroy_all
    (1..self.survey.questionnaire_scale.gsub('n','').to_i).each do
      self.options << Option.create(title: '')
    end
  end

end
