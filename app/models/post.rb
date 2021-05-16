class Post < ApplicationRecord

  belongs_to :customer
  attachment :image
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
   validates :title, presence: true

  def save_tags(savemicropost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savemicropost_tags
    new_tags = savemicropost_tags - current_tags

    old_tags.each do |old_namae|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_tag
    end
  end
end
