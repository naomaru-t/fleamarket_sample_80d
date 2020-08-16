class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :postagepayer
  belongs_to_active_hash :postagetype
  belongs_to_active_hash :preparationdays
  belongs_to_active_hash :sellstatus
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  belongs_to :brand, dependent: :destroy, optional: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  validates_associated :images
  validates :images, presence: true

  validates :name, :introduction, :prefecture, :condition, :postagepayer, :postagetype, :preparationdays, :price, :sellstatus,:category, presence: true
  validates :name, length: {maximum: 40 }
  validates :introduction, length: {maximum: 1000 }
  validates :price, numericality:{only_iteger: true, greater_than: 300,less_than:9999999}

end
