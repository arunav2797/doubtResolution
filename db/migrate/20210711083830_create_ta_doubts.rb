class CreateTaDoubts < ActiveRecord::Migration[6.1]
  def change
    create_table :ta_doubts do |t|
      t.timestamps
    end
  end
end
