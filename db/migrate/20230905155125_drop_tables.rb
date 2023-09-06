class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :likes
    drop_table :comments
    drop_table :posts
    drop_table :users
  end
  def down
    # This is optional but can be used to rollback the changes
    # if needed in the future
    create_table :users do |t|
      # Define user table columns here
      t.timestamps
    end

    create_table :posts do |t|
      # Define post table columns here
      t.timestamps
    end

    create_table :comments do |t|
      # Define comment table columns here
      t.timestamps
    end

    create_table :likes do |t|
      # Define likes table columns here
      t.timestamps
    end
  end
end

