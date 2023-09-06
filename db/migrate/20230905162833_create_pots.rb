class CreatePots < ActiveRecord::Migration[7.0]
  def change
    create_table :pots do |t|
      t.string :name
      t.string :bio
      t.string :photo
      t.integer :post_counter

      t.timestamps
    end
  end
end
