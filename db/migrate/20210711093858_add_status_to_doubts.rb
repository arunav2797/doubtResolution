class AddStatusToDoubts < ActiveRecord::Migration[6.1]
  def change
    add_column :doubts, :status, :integer
  end
end
