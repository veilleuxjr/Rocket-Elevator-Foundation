class Employee< ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable  
  has_many :batteries, dependent: :destroy
  belongs_to :user, dependent: :destroy

  def name
    "#{self.id} #{self.last_name}"
  end

  def company_name
        
  end
end

