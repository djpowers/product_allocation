class Product < ApplicationRecord
  validates :name, presence: true
  validates :weight, numericality: true

  enum :bucket, %i[unallocated loss process donation], default: :unallocated
end
