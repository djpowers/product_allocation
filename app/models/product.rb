class Product < ApplicationRecord
  validates :name, presence: true
  validates :weight, numericality: true

  enum :bucket, %i[loss process donation], validate: true
end
