class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :description, :string
      t.column :rating, :int
      t.column :product_id, :int
      t.column :created_at, :datetime

      t.timestamps
    end
  end
end
