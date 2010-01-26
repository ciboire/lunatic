class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :description_short
      t.boolean :is_hot, :default => false
      t.boolean :is_showcased, :default => false
      t.string :category, :default => 'Miscellaneous'
      t.decimal :price, :precision => 8, :scale => 2, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
