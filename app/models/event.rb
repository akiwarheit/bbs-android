class Event < ActiveRecord::Base
  has_attached_file :image, :styles => { 
    :medium  => "300x300>",:thumb => "100x100>"}
  belongs_to :user
  belongs_to :organization
  
  # named_scope 
    # :this_week, 
    # :all, 
    # :where(:when => Date.today.beginning_of_week..Date.today.end_of_week)
end