class NotesController < ApplicationController
  def new
    @note = Note.new
  end
   
  def create
    @note = Note.new(note_params)

    if @note.save
      ShareUserNote.create!(user_id: current_user.id, note_id: @note.id)
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
    #@notes = Note.
    @note = Note.new
    @share = ShareUserNote.new
    #@shared = ShareUserNote.where(User = current_user).email
  end
  def edit
    @note = Note.find(params[:id])
  end
  
  def update
    @note = Note.find(params[:id])
 
    if @note.update(note_params)
      redirect_to notes_path
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




