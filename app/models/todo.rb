class Todo < ActiveRecord::Base
  belongs_to :user
  has_many :tag_todos
  has_many :tags, through: :tag_todos

  def display_text
    if tags.blank?
      do_what
    elsif tags.count <= 4
      do_what + " (" + display_tags + ")"
    else
      do_what + " (" + display_tags + ", more...)"
    end
  end

  private

  def display_tags
    "#{show_tag_or_tags}: #{tags.first(4).map(&:name).join(", ")}"
  end

  def show_tag_or_tags
    if tags.count > 1
      "tags"
    else
      "tag"
    end
  end
end
