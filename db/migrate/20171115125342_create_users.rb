class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_
      t.string :digest
      t.string :email
      t.boolean :dm
      t.string :roles
      t.integer :reviews_count

      t.timestamps
    end
  end
end
