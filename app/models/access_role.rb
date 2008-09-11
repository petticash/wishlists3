class AccessRole < ActiveRecord::Base
  has_and_belongs_to_many :access_modules
  
  def has_access_to_module?(module_name)
    self.access_modules.collect(&:name).include? module_name.to_s
  end
end
