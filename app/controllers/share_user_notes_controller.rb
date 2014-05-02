class ShareUserNotesController < ActionController::Base

    
  def create
    @share  = ShareUserNote.new
    if @share.save
      #email = User.where(email: params[:share_user_note][:user_id])
      email = params[:share_user_note][:user_id]
      note = params[:note_id]
      ShareUserNote.create(user_id: email, note_id: note)
      redirect_to notes_url, :notice => "Shared note"
    else
      render 'new'
    end
  end   
end