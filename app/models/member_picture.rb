class MemberPicture < ActiveRecord::Base
    belongs_to :member

    attr_reader :uploaded_image

    IMAGE_TYPES =
      { "image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }

    def extension
      IMAGE_TYPES[pictype]
    end

    # def uploaded_image=(image)
    #   self.pictype = convert_pictype(image.pictype)
    #   self.image = image.read
    #   @uploaded_image = image
    # end
    #
    # private
    # def convert_pictype(ptype)
    #   ptype = ptype.rstrip.downcase
    #   case ptype
    #     when "image/pjpeg" then "image/jpeg"
    #     when "image/jpg" then "image/jpeg"
    #     when "image/x-png" then "image/jpeg"
    #     else ptype
    #   end
    # end
end
