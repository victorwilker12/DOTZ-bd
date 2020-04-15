class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


# validates :nome, if: :nome
# validates :email, if: :email 

# validates :password, if: :password
# validates :cpf, if: :cpf

  before_save :add_moeda

  has_many :purchases, dependent: :destroy
  has_one :dotz, dependent: :destroy 
  accepts_nested_attributes_for :dotz
  
  belongs_to :admin, optional: true

  def add_moeda
    Dotz.create(moeda: 0, client_id: self.id)
  end
  
end
