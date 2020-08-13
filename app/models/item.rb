class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :postagepayer
  belongs_to_active_hash :postagetype
  belongs_to_active_hash :preparationdays
  belongs_to_active_hash :size
  belongs_to_active_hash :sellstatus
  belongs_to :brand, dependent: :destroy
  accepts_nested_attributes_for :brand

  # belongs_to :saler, class_name: "User"
  # belongs_to :buyer, class_name: "User"

  validates :name, :introduction, :prefecture, :condition, :postagepayer, :postagetype, :preparationdays, :price, :sellstatus, presence: true
  validates :name, length: {maximum: 40 }
  validates :introduction, length: {maximum: 1000 }
  # validates :price, numericaliity:{only_iteger: true, greater_than: 300,less_than:9999999}

end