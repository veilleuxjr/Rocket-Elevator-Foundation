class Employee< ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable  
  has_many :batteries, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_many :intervention

  def self.select_values
    Employee.all.map { |employee| [employee.first_name, employee.id, { data { url: data_url(employee)}}]}
  end

  private

    def self.data_url(employee)
      Rails.application.routes.url_helpers.employee_intervention_path(employee, format: :json)
    end


  def name
    "#{self.id} #{self.last_name}"
  end

  def company_name
        
  end
end

