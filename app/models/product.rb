class Product < ApplicationRecord
    belongs_to :Admin, optional: true
    has_one :purchase, dependent: :destroy
    has_one_attached :image
    validates :estoque, numericality: { greater_than_or_equal_to: 0, message: "Você não pode esvaziar o estoque!!"}
end
