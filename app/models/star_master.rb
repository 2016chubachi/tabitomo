class StarMaster < ActiveRecord::Base
  has_many :user_reviews

  IMAGE_TYPES =
  { "image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }

  #DBのpictypeを取得して、上のIMAGE_TYPESのハッシュを返す
  #現状のテーブルの値はimage/gif　なので　gif が返る
  def extension
    IMAGE_TYPES[pictype]
  end

end
