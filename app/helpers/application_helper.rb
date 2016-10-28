module ApplicationHelper
  def star_image_tag(star_master)
    path =  star_master_path(star_master, format: star_master.extension)
    image_tag path
  end
  
  # 会員写真表示
  def member_image_tag(member, options ={})
    if member.member_picture.present?
      path = member_path(member,format: member.member_picture.extension)
      image_tag(path,{ alt: member.item_name}.merge(options))
    else
      image_tag("/assets/no-image.png",options)
    end
  end
end
