#評価マスタ
1.upto(5) do |idx|
  path = Rails.root.join("db/seeds", Rails.env, "ico_grade6_#{idx}.gif")
  file = Rack::Test::UploadedFile.new(path, "image/gif", true).read
  StarMaster.create(
    image: file,
    pictype: "image/gif"
  )
end

#uploaded_imageの実装ができていないときは下記のようにしてテストデータを作る
#path = Rails.root.join("db/seeds/development", "sample1.jpg")
#readでバイナリーにする
#file = Rack::Test::UploadedFile.new(path, "image/jpeg", true).read
#LoanItemImage.create(loan_item_id: 1, image: file, content_type: "image/jpeg")

# 0.upto(9) do |idx|
#   path = Rails.root.join("db/seeds", Rails.env, "sample#{idx % 4 + 1}.jpg")
#   file = Rack::Test::UploadedFile.new(path, "image/jpeg", true)
#   LoanItemImage.create(
#     loan_item_id: idx + 1,
#     uploaded_image: file
#   )
# end
