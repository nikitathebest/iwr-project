class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :highschool
      t.string :faculty
      t.string :department
      t.integer :year_of_start
      t.integer :year_of_end
      t.string :english
    
      t.timestamps
    end
    
    add_reference :educations, :user, foreign_key: true
  end
end
