class Droppot < ActiveRecord::Migration[7.0]
  def change

  end
  def up
    # This is where you would specify how to create the table if you needed to.
  end

  def down
    drop_table :pot
  end
end
