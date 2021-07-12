class AddAcceptedTimestampToDoubts < ActiveRecord::Migration[6.1]
  def change
    add_column :doubts, :accepted_at, :datetime
  end
end
