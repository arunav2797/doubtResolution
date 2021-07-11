class AddUserIdFKtoTaDoubts < ActiveRecord::Migration[6.1]
  def change
    add_reference :ta_doubts, :user, foreign_key: true
  end
end