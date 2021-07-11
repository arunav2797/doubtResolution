class CreateDoubts < ActiveRecord::Migration[6.1]
  def change
    create_table :doubts do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
