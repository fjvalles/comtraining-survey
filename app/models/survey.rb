class Survey < ApplicationRecord
  belongs_to :company
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :proficiencies, dependent: :destroy
  has_many :question_defaults, dependent: :destroy
  has_many :options, through: :question_defaults
  has_many :employees, dependent: :destroy
  has_many :employee_responses, through: :employees, source: :response, class_name: 'Response'

  has_rich_text :description
  has_rich_text :welcome_msg
  has_rich_text :instructions
  has_rich_text :goodbye_msg

  validates :company_id, :s_type, presence: true

  enum s_type: [:ecl, :lef_360, :skw_360, :aap_360, :lej_360, :tes_pm, :exa_pm, :mbti]
  enum questionnaire_scale: [:n2, :n4, :n5, :n6, :n8]

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :proficiencies, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :question_defaults, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :employees, reject_if: :all_blank, allow_destroy: true

  before_destroy :check_status
  before_update :check_status
  after_create :set_question_defaults
  after_save :set_token

  def quest_default(quest_type)
    question_defaults.each do |qd|
      return qd if qd.q_type == quest_type
    end
  end

  def set_question_defaults
    unless question_defaults.present?
      Survey.questionnaire_scales.each do |a, b|
        qd = QuestionDefault.create(q_type: a)
        (1..a.gsub('n','').to_i).each do
          qd.options << Option.create(title:'')
        end
        question_defaults << qd
      end
    end
  end

  def check_status
    if status == 'Diseño'
      true
    else
      false
    end
  end

  def status
    if start_date.present? && end_date.present?
      now = DateTime.now
      if now > start_date
        if now < end_date
          return 'En Desarrollo'
        else
          return 'Cerrada'
        end
      end
    end
    'Diseño'
  end

  def aligment
    if default_alignment
      :vradio
    else
      :hor_radio
    end
  end

  def set_token
    self.token = SecureRandom.hex[0, 10].upcase + self.id.to_s
  end
end
