class AddAttachmentPhotoToLicencePictures < ActiveRecord::Migration
  def self.up
    change_table :licence_pictures do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :licence_pictures, :photo
  end
end
