class User < ActiveRecord::Base

  has_and_belongs_to_many :groups

  # Virtual attribute for the unencrypted password
  attr_accessor :password
  
  belongs_to :access_role
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by_id'
  belongs_to :updated_by, :class_name => 'User', :foreign_key => 'updated_by_id'

  validates_presence_of     :first_name, :last_name, :login, :email, :access_role_id
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  before_save :encrypt_password
  before_save :set_created_by_id
  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :first_name, :last_name, :login, :access_role_id, :email, :password, :password_confirmation

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end
  
  ### Custom methods
  
  def has_access_to_module?(module_name)
    self.access_role.has_access_to_module?(module_name)
  end
  
  def display_name
  "#{self.login} - #{self.last_name}, #{self.first_name}"
  end
  
  def set_created_by_id
    if self.created_by_id.blank?
      self.created_by_id=self.updated_by_id
    end    
  end


  def name
    "#{self.first_name} #{self.last_name}"     
  end
  
  def group_ids
    grps = ""
    self.groups.each do |grp|
      if !grps.blank? 
        grps = grps + ", "
      end
      grps = grps + grp.id.to_s
    end
    grps
  end  
  
  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    def get_users_in_group(grp)
      #find(:all,:conditions => {:group => grp})
      
    end
  
  
end
