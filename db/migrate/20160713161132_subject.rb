class Subject < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.column :name, :string
      t.timestamps null: false
    end
    Subject.create :name =>"Physics"
    Subject.create :name =>"Mathematics"
    Subject.create :name =>"Chemistry"
    Subject.create :name =>"Psychology"
    Subject.create :name =>"Geography"

    t.timestamps null: false
  end
# method is used when migrating to a new version  
  def self.up
  	create_table :subjects do |t|
  		t.column :name, :string
  	end

  	Subject.create :name =>"Physics"
  	Subject.create :name =>"Mathematics"
  	Subject.create :name =>"Chemistry"
  	Subject.create :name =>"Psychology"
  	Subject.create :name =>"Geography"

    t.timestamps null: false
  end
#  method is used when rolling back any changes if needed
  def self.down
  	drop_table :subjects
  end
end
