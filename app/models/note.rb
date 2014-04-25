class Note < ActiveRecord::Base

  belongs_to :user
  has_many :users
  validates :title, presence: true,
                    length: { minimum: 5 }
end
