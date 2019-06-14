# frozen_string_literal: true

# Class for delete column "Profile id" in User table
class DeleteColumnProfileIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_id
  end
end
