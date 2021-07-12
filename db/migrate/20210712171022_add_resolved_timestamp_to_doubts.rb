class AddResolvedTimestampToDoubts < ActiveRecord::Migration[6.1]
  def change
    add_column :doubts, :resolved_at, :datetime
  end
end
