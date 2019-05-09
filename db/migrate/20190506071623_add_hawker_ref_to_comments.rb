class AddHawkerRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :hawker, foreign_key: true
  end
end
