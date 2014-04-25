class Note < ActiveRecord::Base

  #belongs_to :user
  has_many :share_user_notes
  has_many :users, :through => :share_user_notes
  validates :title, presence: true,
                    length: { minimum: 5 }
end
