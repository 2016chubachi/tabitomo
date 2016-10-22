# #メンバー
# Member.create(
#   first_name:  "Shuhei",
#   last_name:  "Yamamoto",
#   email: "a1548sy@aiit.ac.jp",
#   country_id: 1 ,
#   telphone: "080-1234-5678",
#   gender: 1
# )
# Member.create(
#   first_name:  "Takeshi",
#   last_name:  "tou",
#   email: "a15xx@aiit.ac.jp",
#   country_id: 2 ,
#   telphone: "080-1234-5678",
#   gender: 1
# )
# Member.create(
#   first_name:  "Mike",
#   last_name:  "Takahashi",
#   email: "a15xx@aiit.ac.jp",
#   country_id: 3 ,
#   telphone: "080-1234-5678",
#   gender: 1
# )
# Member.create(
#   first_name:  "Saori",
#   last_name:  "To",
#   email: "a15xx@aiit.ac.jp",
#   country_id: 2 ,
#   telphone: "080-1234-5678",
#   gender: 2
# )
# Member.create(
#   first_name:  "Kenya",
#   last_name:  "Okada",
#   email: "a15xx@aiit.ac.jp",
#   country_id: 2 ,
#   telphone: "080-1234-5678",
#   gender: 1
# )
# Member.create(
#   first_name:  "Yasutaka",
#   last_name:  "Shimizu",
#   email: "a15xx@aiit.ac.jp",
#   country_id: 2 ,
#   telphone: "080-1234-5678",
#   gender: 1
# )

member = Member.new(:first_name => 'Shuhei',:last_name => 'Yamamoto', :email => 'a1548sy@aiit.ac.jp', :password => 'a1548sy', :country_id => 1, :telphone => '080-1234-5678',:gender => 1)
member.save!

member = Member.new(:first_name => 'Takeshi',:last_name => 'tou', :email => 'a1535yt@aiit.ac.jp', :password => 'a1535yt', :country_id => 1, :telphone => '080-1234-5678',:gender => 1)
member.save!

member = Member.new(:first_name => 'Mike',:last_name => 'Takahashi', :email => 'a15z2hk@aiit.ac.jp', :password => 'a15z2hk', :country_id => 1, :telphone => '080-1234-5678',:gender => 1)
member.save!

member = Member.new(:first_name => 'Saori',:last_name => 'To', :email => 'a1534zt@aiit.ac.jp', :password => 'a1534zt', :country_id => 1, :telphone => '080-1234-5678',:gender => 2)
member.save!

member = Member.new(:first_name => 'Kenya',:last_name => 'Okada', :email => 'a1547sy@aiit.ac.jp', :password => 'a1547sy', :country_id => 1, :telphone => '080-1234-5678',:gender => 1)
member.save!

member = Member.new(:first_name => 'Yasutaka',:last_name => 'Shimizu', :email => 'a1419ys@aiit.ac.jp', :password => 'a1419ys', :country_id => 1, :telphone => '080-1234-5678',:gender => 1)
member.save!
