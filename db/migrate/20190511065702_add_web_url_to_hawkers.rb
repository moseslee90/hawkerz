# frozen_string_literal: true

class AddWebUrlToHawkers < ActiveRecord::Migration[5.2]
  def change
    change_table :hawkers do |t|
      t.text :site_url
    end
  end
end
