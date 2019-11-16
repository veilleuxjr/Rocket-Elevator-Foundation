class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

   devise :database_authenticatable, :registerable,
         :rememberable, :recoverable  
  has_one :customer
  has_one :employee
  def is_admin?
    self.employee
  end 
end
