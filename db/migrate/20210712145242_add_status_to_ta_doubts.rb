class AddStatusToTaDoubts < ActiveRecord::Migration[6.1]
  def change
    add_column :ta_doubts, :status, :integer
  end
end
