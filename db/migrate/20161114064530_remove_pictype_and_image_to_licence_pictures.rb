class RemovePictypeAndImageToLicencePictures < ActiveRecord::Migration
  def change
    # [形式] remove_column(テーブル名, カラム名)
    remove_column :licence_pictures, :pictype, :string
    remove_column :licence_pictures, :image, :string
  end
end
