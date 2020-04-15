class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


# validates :nome, if: :nome
# validates :email, if: :email 

# validates :password, if: :password
# validates :cpf, if: :cpf


  has_many :purchases
  belongs_to :admin, optional: true
end
