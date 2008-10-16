class NotesController < ApplicationController

  before_filter Proc.new{|controller| controller.requires_access_to_module :NOTES}, :except => [:show, :index ]

  def new
  end
  
  def index
    @notes = Note.find(:all, :order => "created_at DESC")
  end
  
  def side_notes
    @notes = Note.find(:all, :order => "created_at DESC", :limit => 5)
  end 
  
  def show
    @note = Note.find(params[:id])
  end  
  
  def edit
    @note = Note.find(params[:id])
  end  

  def create
    @note = Note.new(params[:note])
    @note.updated_by_id = current_user.id    
    
    @note.save
    if @note.errors.empty?
      redirect_to(notes_path)
      flash[:notice] = "News and Note successfully created."
    else
      render :action => 'new'
    end
  end
  
  
  def update
     @note = Note.find(params[:id])
     
     if @note.update_attributes(params[:note].merge({:updated_by_id => current_user.id}))

       flash[:notice] = "News and Note successfully updated"
      redirect_to note_path(@user)
    else
      flash[:notice] = "News and Note not updated"
      render :action => 'edit'
    end    
  end
  
  
end
