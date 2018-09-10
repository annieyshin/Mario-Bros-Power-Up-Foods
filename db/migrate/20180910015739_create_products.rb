class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :cost, :int
      t.column :product_id, :int
      t.column :country_of_origin, :string
      t.column :created_at, :datetime

      t.timestamps
    end
  end
end
