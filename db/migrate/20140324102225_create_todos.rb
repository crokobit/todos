class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :do_what

      t.timestamps
    end
  end
end
