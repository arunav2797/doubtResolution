class AddSolutionToDoubts < ActiveRecord::Migration[6.1]
  def change
    add_column :doubts, :solution, :string
  end
end
