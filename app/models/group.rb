class Group < ActiveRecord::Base

  has_and_belongs_to_many :users
  
  def self.find_users_groups(current_user)
    grps = self.find(:all)
    grps.delete_if{|grp| grp.common_groups(current_user).blank?}
    grps
  end
  
  def common_groups(current_user)
    [self] & current_user.groups       
  end
  
end
