class AddEducationToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :educations, :user, foreign_key: true
  end
end