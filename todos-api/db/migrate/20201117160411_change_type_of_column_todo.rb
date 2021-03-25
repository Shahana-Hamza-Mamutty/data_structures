class ChangeTypeOfColumnTodo < ActiveRecord::Migration[6.0]
  def change
  	change_column :todos, :created_by, :integer, using: 'created_by::integer'
  	add_foreign_key :todos, :users, column: :created_by
  end
end
