class Item < ApplicationRecord
  belong_to :user
  validates :content, presence: true, unless: :image?
end
