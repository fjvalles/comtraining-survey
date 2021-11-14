class User < ApplicationRecord
  has_many :responses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]
  enum gender: [:male, :female]

  validates :first_name, :last_name, presence: true

  def age
    return 'Desconocida' if birthday.nil?
    today ||= Date.current
    diff = (12 * today.year + today.month) - (12 * birthday.year + birthday.month)
    y = diff.divmod 12
    y == 1 ? '1 año' : "#{y} años"
  end

  def full_name
    first_name + ' ' + last_name
  end

end
