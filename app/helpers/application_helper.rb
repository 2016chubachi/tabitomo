module ApplicationHelper
  def star_image_tag(star_master)
    path =  star_master_path(star_master, format: star_master.extension)
    image_tag path
  end

  # 会員写真表示
  def member_image_tag(member, options ={})
    # binding.pry
    if member.member_picture.present? && !member.member_picture.new_record?
      path = member_picture_path(member.member_picture,format: member.member_picture.extension)
      image_tag(path, {style: "max-width: 252px;max-height:180px;"}.merge(options))
    else
      image_tag("/assets/no-image.png",{style: "max-width: 252px"}.merge(options))
    end
  end

  # license 写真表示
  def licence_image_tag(guide, options ={})
    if guide.licence_picture.present? && !guide.licence_picture.new_record?
      path = licence_picture_path(guide.licence_picture,format: guide.licence_picture.extension)
      image_tag(path, {style: "max-width: 252px;max-height:180px;"}.merge(options))
    else
      image_tag("/assets/no-image.png",{style: "max-width: 252px"}.merge(options))
    end
  end

  # bookingが過去か確認する
  def past_booking?(booking)
    unless booking.new_record?
      Date.today > booking.booking_schedules.maximum(:traveler_date)
    end
  end

end
