class Announcement < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
end
