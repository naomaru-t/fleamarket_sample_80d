class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  validates :password ,presence: true, length: { minimum: 7 }
  validates :nickname ,presence: true

  has_one :profile
  has_one :sending
  has_one :credit_card, dependent: :destroy

end
