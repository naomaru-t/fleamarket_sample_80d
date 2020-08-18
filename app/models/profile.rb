class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date,presence: true
  VALID_FIRSTNAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :first_name, format: { with: VALID_FIRSTNAME_REGEX }
  VALID_FAMILYNAME_REGEX = /\A[一-龥]+\z/
  validates :family_name, format: { with: VALID_FAMILYNAME_REGEX }
  VALID_KANA_REGEX =/\A[ぁ-んー－]+\z/
  validates :first_name_kana, format: { with: VALID_KANA_REGEX }
  validates :family_name_kana, format: { with: VALID_KANA_REGEX }
end
