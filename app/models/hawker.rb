# frozen_string_literal: true

class Hawker < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :images,
                                reject_if: ->(a) { a[:image_url].blank? },
                                allow_destroy: true
end
