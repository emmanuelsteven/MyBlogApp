class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :bio
      t.integer :post_counter 
      t.timestamps
    end
  end
end
