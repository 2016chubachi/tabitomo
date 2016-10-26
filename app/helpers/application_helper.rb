module ApplicationHelper
  def star_image_tag(star_master)
    path =  star_master_path(star_master, format: star_master.extension)
    image_tag path
  end
end
