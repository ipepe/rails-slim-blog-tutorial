class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5 }

  # that is simple way how to slug, better way with slug history and stuff is friendly-id
  # http://railscasts.com/episodes/314-pretty-urls-with-friendlyid?view=asciicast
  def to_param
    "#{id} #{title}".parameterize
  end
end