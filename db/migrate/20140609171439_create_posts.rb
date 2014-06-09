class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :comment
      t.references :user, index: true

      t.timestamps
    end
  end
end
