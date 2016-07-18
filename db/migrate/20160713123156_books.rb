
class Books < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.column :title, :string, :limit =>32, :null =>false
      t.column :price, :float
      t.column :subject_id, :integer
      t.column :description, :text

      t.timestamps null: false
    end
  end
# method is used when migrating to a new version  
  def self.up
  	create_table :books do |t|
  		t.column :title, :string, :limit =>32, :null =>false
  		t.column :price, :float
  		t.column :subject_id, :integer
  		t.column :description, :text

      t.timestamps null: false
  	end
  end

#  method is used when rolling back any changes if needed
  def self.down
  	drop_table :books
  end
end
