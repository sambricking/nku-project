class NotesController < ApplicationController
  def new
    @note = Note.new
  end
   
  def create
    @note = Note.new(note_params)
   
    if @note.save
      redirect_to notes_path
    else
      render 'new'
    end
  end


  def show
    @note = Note.find(params[:id])
  end

  def index
    @notes = current_user.notes
    @note = Note.new
  end
  def edit
    @note = Note.find(params[:id])
  end
  
  def update
    @note = Note.find(params[:id])
 
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end
  
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
 
    redirect_to notes_path
  end
  
private
  def note_params
    params[:note][:user_id] = current_user.id
    params.require(:note).permit(:title, :text, :user_id)
  end


end




