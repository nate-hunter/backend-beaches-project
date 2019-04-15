class Beach < ApplicationRecord
  validates :name, presence: true
  validates :island, presence: true
  validates :location, presence: true
  validates :img, presence: true
end
