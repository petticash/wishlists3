class Note < ActiveRecord::Base

  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by_id'
  belongs_to :updated_by, :class_name => 'User', :foreign_key => 'updated_by_id'

  before_save :set_created_by_id

  def set_created_by_id
    if self.created_by_id.blank?
      self.created_by_id=self.updated_by_id
    end    
  end
  
  def name_abbr
    name[0,75]+"..."
    
  end
  def name_for_html
    self.name.gsub(/(\r\n)/){"<br/>"}  
    
  end  
  
  
end
