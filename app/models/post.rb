class Post < ActiveRecord::Base

  validates_presence_of :title, :body, :status, :author_id

  def publish!
    self.published_at = Time.now
    self.status = "published"
    self.save
  end

end
