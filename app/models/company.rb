class Company < ActiveRecord::Base
  
  def self.search(search)
  		if search
  			where('companyName LIKE ? or jobTitle LIKE ? or nationality LIKE ? or gender LIKE ? 
  				or age LIKE ? or disability LIKE ? or education LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  		else
  			all
  		end
  	end
    
    
    before_save do
      self.disability.gsub!(/[\[\]\"]/, "") if attribute_present?("disability")
    end
  
  
  belongs_to :country
  validates :companyName, :jobTitle, :jobDescription, :contactPerson, :mobileNo, :email, presence: true
  
end
