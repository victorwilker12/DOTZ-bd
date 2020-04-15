class Product < ApplicationRecord
    belongs_to :Admin, optional: true
    has_one :purchase, dependent: :destroy
    has_one_attached :image
end
