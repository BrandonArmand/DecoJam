class AddTaskToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :task, foreign_key: true
  end
end
