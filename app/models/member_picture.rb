class MemberPicture < ActiveRecord::Base
    belongs_to :member

    attr_reader :uploaded_image

    validate :check_image

    IMAGE_TYPES =
      { "image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }

    def extension
      IMAGE_TYPES[pictype]
    end

    def uploaded_image=(image)
      self.pictype = convert_pictype(image.content_type)
      self.image = image.read
      @uploaded_image = image
    end

    private
    def convert_pictype(ptype)
      ptype = ptype.rstrip.downcase
      case ptype
        when "image/pjpeg" then "image/jpeg"
        when "image/jpg" then "image/jpeg"
        when "image/x-png" then "image/jpeg"
        else ptype
      end
    end

    def check_image
      if self.image
        if self.image.size > 100.kilobytes
          errors.add(:uploaded_image, "too_big_image")
        end
        unless IMAGE_TYPES.has_key?(pictype)
          errors.add(:uploaded_image, "invalid_image")
        end
      end
    end
end
