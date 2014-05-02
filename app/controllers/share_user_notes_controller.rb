class ShareUserNotesController < ActionController::Base

    
  def create
    @share  = ShareUserNote.new
    if @share.save
      email = params[:share_user_note][:email]
      note = params[:note_id]
      if ShareUserNote.exists?(email: email, note_id: note)
        redirect_to notes_url, :notice => "Note has already been share with this user"
      else 
        ShareUserNote.create(email: email, note_id: note)
        redirect_to notes_url, :notice => "Shared note"
      end
      
    else
      render 'new'
    end
  end   
end