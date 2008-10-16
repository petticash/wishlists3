class Wish < ActiveRecord::Base

  has_and_belongs_to_many :groups

  belongs_to :purchased_by, :class_name => 'User', :foreign_key => 'purchased_by_id'
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by_id'
  belongs_to :updated_by, :class_name => 'User', :foreign_key => 'updated_by_id'
  
  before_save :set_created_by_id

  def set_created_by_id
    if self.created_by_id.blank?
      self.created_by_id=self.updated_by_id
    end    
  end  
  
  
  def name_for_html
    self.name.gsub(/(\r\n)/){"<br/>"}      
  end
  
  def common_group_names(current_user)
    common_groups(current_user).collect{|g| g.name}.join(', ')
  end
  
  def common_groups(current_user)
    self.groups & current_user.groups    
  end
  
end
