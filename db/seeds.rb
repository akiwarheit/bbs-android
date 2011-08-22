Organization.delete_all
Affiliation.delete_all

organizations = ['CICCT', 'COE', 'CAS']

organizations.each do |organization|
  Organization.create(:description => organization)
end

User.create(:email=>'akiwarheit@gmail.com', :password => 'inlove123',
  :encrypted_password => 'inlove123', :is_admin => true)

keeboi = User.first
keeboi.toggle!(:is_admin)
his_org = Organization.first
his_other_org = Organization.last

keeboi.organizations << his_org
keeboi.organizations << his_other_org