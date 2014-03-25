class CreateTagTodos < ActiveRecord::Migration
  def change
    create_table :tag_todos do |t|
      t.integer :tag_id
      t.integer :todo_id
    end
  end
end
