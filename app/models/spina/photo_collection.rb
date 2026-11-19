module Spina
  class PhotoCollection < ApplicationRecord
    include PhotoCollectable

    has_one :page_part, as: :page_partable
    has_many :photo_collections_photos, autosave: true
    has_many :photos, through: :photo_collections_photos
    has_many :structure_parts, as: :structure_partable

    accepts_nested_attributes_for :photos, allow_destroy: true

    def content
      self
    end

    alias_method :old_update, :update
    def update(attributes)
      self.photos.clear if attributes.reject{|key,value| key == "id" }.blank?
      old_update(attributes)
    end

  end
end
