class AdduserIdFkToDoubts < ActiveRecord::Migration[6.1]
  def change
    add_reference :doubts, :user, foreign_key: true
  end
end