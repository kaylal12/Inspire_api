class Image < ActiveRecord::Base
  belongs_to :profile

  has_attached_file :image_post,
              :styles => { :medium => "500x500>", :thumb => "300x300>" },
              :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_post, :content_type => /\Aimage\/.*\Z/

  def rename_image_post
    self.image_post.instance_write :file_name, "#{Time.now.to_i.to_s}.png"
  end

  before_post_process :rename_image_post
end
