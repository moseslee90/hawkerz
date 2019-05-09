# frozen_string_literal: true

class AddColumnsToHawkers < ActiveRecord::Migration[5.2]
  def change
    change_table :hawkers do |t|
      t.text :hero_image_url
      t.text :opening_hours
      t.text :closing_hours
      t.float :latitude
      t.float :longitude
    end
  end
end
