class UsersController < ApplicationController
  before_filter Proc.new{|controller| controller.requires_access_to_module :USERS}, :except => [:show, :edit, :update ]

  def index
    @users = User.find(:all)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  # render new.rhtml
  def new
  end

  def edit_password
    @user = User.find(params[:id])   
    
  end


  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.updated_by_id = current_user.id    
    @user.groups = Group.find(params[:group_ids]) if !params[:group_ids].blank?
    
    @user.save
    if @user.errors.empty?
      # self.current_user = @user
      redirect_to(users_path)
      # redirect_back_or_default('/')
      flash[:notice] = "User successfully created."
    else
      render :action => 'new'
    end
  end
 
  def update
     @user = User.find(params[:id])
     #raise params.inspect
     if @user.update_attributes(params[:user].merge({:updated_by_id => current_user.id}))
          #raise params[:id].inspect
          #raise params[:group_ids].blank?.inspect
          @user.groups = Group.find(params[:group_ids]) if !params[:group_ids].blank?
       flash[:notice] = "User successfully updated"
      redirect_to user_path(@user)
    else
      flash[:notice] = "User not updated"
      render :action => 'edit'
    end
    
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  


end
