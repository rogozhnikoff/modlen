class Picture < ActiveRecord::Base
  has_attached_file :image, :styles => {:thumb => "100x1000>", main_page: "245:1000>", micro: "31:31>"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :variant
def size
  Paperclip::Geometry.from_file self.image
end
end
