class WishesController < ApplicationController


  def new
    
  end
  
  def show
    @frompage = params[:frompage]
    @wish = Wish.find(params[:id])    
  end
  
  def index
    @user_id = params[:user_id]
    @wishes = Wish.find(:all, :conditions => ['created_by_id = ? and expired = 0', params[:user_id]])
    @wishes.delete_if{|wish| wish.common_groups(current_user).blank?}
  end
  
  def index_purchased
    @wishes = Wish.find(:all, :conditions => ['purchased_by_id = ?', current_user.id])
  end  
  
  
  def edit
    @wish = Wish.find(params[:id])
  end    
  
  def create
  #raise params.inspect
  
    @wish = Wish.new(params[:wish])
    @wish.updated_by_id = current_user.id  
    @wish.locked = 0
    
    @wish.save
    if @wish.errors.empty?
      redirect_to(wishes_path(:user_id => current_user.id))
      flash[:notice] = "Wish successfully created."
    else
      render :action => 'new'
    end
    #wishes_params  = params[:wishes].reject{ |wish| wish[:name].blank?  }

    #@wishes = wishes_params.collect do |wish_params|
    #  wish = Wish.new(wishes_params.merge({:locked => 0,:updated_by_id => current_user.id}))
    #end
    #@user.groups = Group.find(params[:group_ids]) if !params[:group_ids].blank?
    #respond_to do |format|
    #  if @wishes.all?{|wish| wish.save} #  this needs more work
    #    flash[:notice] = 'All wishes created successfully'
    #    format.html { redirect_to wishes_path(:wish => {:created_by_id => @wishes[0].created_by_id}) }
    #    format.xml  { render :xml => @wishes, :status => :created, :location => @wishes }
    #  else
    #    flash[:notice] = 'Some wishes not created'
    #    format.html { render :action => "new" }
    #    format.xml { render :xml => @wishes.collect{|e| e.errors}, :status => :unprocessable_entity }
    #  end
    #end
  end  
  
  
  def update
     @wish = Wish.find(params[:id])
     
     if @wish.update_attributes(params[:wish].merge({:updated_by_id => current_user.id}))

       flash[:notice] = "Wish successfully updated"
      redirect_to wish_path(@wish, :user_id => current_user.id)
    else
      flash[:notice] = "Wish not updated"
      render :action => 'edit'
    end    
  end
  
  
  
  def all_wishes
    #@users_in_group = User.get_users_in_group()
  end
  
  def purchase
  #, :confirm => 'Do you want to mark this wish as purchased by you?', :frompage => 'index'
    wish = Wish.find(params[:wish])
    flash_text = ""
    if wish.purchased_by.blank?
      wish.update_attributes({:purchased_by => current_user})
      flash_text = "Wish marked as purchased" 
    else
      wish.update_attributes({:purchased_by => nil})
      flash_text = "Wish's purchase status removed"       
    end
    if params[:frompage] == "index"
      flash[:notice] = flash_text
      redirect_to(wishes_path(:user_id => wish.created_by_id))
    elsif params[:frompage] == "show"
      flash[:notice] = "Wish marked as purchased"
      redirect_to wish_path(@wish, :user_id => wish.created_by_id)
    end
  end
  
  def destroy
    
    @wish = Wish.find(params[:id])
   
    @wish.expired = 1
    
    @wish.save
    
    respond_to do |format|
    
      flash[:notice] = "Wish deleted"
      format.html { redirect_to( wishes_path(:user_id => @wish.created_by_id)) }
      format.xml  { head :ok }
    end
  end
  
end
