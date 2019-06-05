class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :highschool
      t.string :faculty
    
      t.timestamps
    end
  end
end