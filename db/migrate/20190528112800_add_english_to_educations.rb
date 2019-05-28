class AddEnglishToEducations < ActiveRecord::Migration[5.2]
  def change
    add_column :educations, :english, :string
  end
end
