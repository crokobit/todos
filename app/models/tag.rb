class Tag < ActiveRecord::Base
  has_many :tag_todos
  has_many :todos, through: :tag_todos
end
