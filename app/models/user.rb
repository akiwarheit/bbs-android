class User < ActiveRecord::Base
  has_many :events
  has_many :affiliations
  has_many :organizations, :through => :affiliations
  # Include default devise modules. Others available are:  
  # :token_authenticatable, :lockable, :timeoutable and :activatable  
  # :confirmable  
  devise :database_authenticatable, :registerable,   
         :recoverable, :rememberable, :trackable, :validatable  
  
  # Setup accessible (or protected) attributes for your model  
  attr_accessible :email, :password, :password_confirmation  
end