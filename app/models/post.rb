class Post < ApplicationRecord
  include PgSearch

  pg_search_scope :search_by_posts, :against => :caption,
    :using =>  {:tsearch => {:prefix => true}
   }


  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :comments, dependent: :destroy

  def is_belongs_to? user
        Post.find_by(user_id: user.id, id: id)
    end


end
