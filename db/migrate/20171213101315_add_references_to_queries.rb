class AddReferencesToQueries < ActiveRecord::Migration[5.1]
  def change
    add_reference :queries, :user, foreign_key: true
    add_reference :queries, :student, foreign_key: true
  end
end
