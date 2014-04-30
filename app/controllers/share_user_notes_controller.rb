class ShareUserNotesController < ActionController::Base

    
  def create
    @share  = ShareUserNote.new
    if @share.save
      user_id = params[:share_user_note][:user_id]
      note = params[:note_id]
      ShareUserNote.create(user_id: user_id, note_id: note)
      redirect_to notes_url, :notice => "Shared note"
    else
      render 'new'
    end
  end   
end