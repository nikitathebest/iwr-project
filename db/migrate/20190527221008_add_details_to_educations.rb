class AddDetailsToEducations < ActiveRecord::Migration[5.2]
  def change
    add_column :educations, :department, :string
    add_column :educations, :year_of_start, :integer
    add_column :educations, :year_of_end, :integer
  end
end
