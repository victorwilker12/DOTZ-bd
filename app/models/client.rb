class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


# validates :nome, if: :nome
# validates :email, if: :email 

# validates :password, if: :password
# validates :cpf, if: :cpf

  validates :saldo_dotz, numericality: { greater_than_or_equal_to: 0 }
  has_many :purchases, dependent: :destroy

  belongs_to :admin, optional: true
  
  
end
