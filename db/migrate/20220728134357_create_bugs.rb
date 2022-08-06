class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :des
      t.integer :bugtype
      t.integer :status
      t.integer :creator_id
      t.integer :resolver_id
      t.string :screenshot
      t.date :deadline
      t.references :project
    
      t.timestamps
    end
  end
end
