class ShareUserNotesController < ActionController::Base

    
  def create
    @share  = ShareUserNote.new
    if @share.save
      email = params[:share_user_note][:email]
      note = params[:note_id]
      if ShareUserNote.exists?(email: email, note_id: note)
        redirect_to notes_url, :notice => "Note no have been share. No more share."
      elsif User.exists?(email: email)
        ShareUserNote.create(email: email, note_id: note)
        redirect_to notes_url, :notice => "Note have been share"
      else 
        redirect_to notes_url, :notice => "User is not exist"
      end
      
    else
      render 'new'
    end
  end   
end