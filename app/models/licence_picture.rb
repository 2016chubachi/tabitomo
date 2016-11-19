class LicencePicture < ActiveRecord::Base
    belongs_to :guide

    has_attached_file :photo,
                      #http://qiita.com/zakihaya/items/8b6f5510871b49870559
                      #PaperClipのstyleで指定する記号の意味
                      styles: { medium: "300x", thumb: "100x" },
                      #default_url: "/images/:style/missing.png",
                      #reset the quality of img
                      convert_options: {original: "-quality 85 -strip" },
                      #if the path was reset,so did the url
                      path: ":rails_root/public/images/:style/:id_:filename",
                      url: "/images/:style/:id_:filename"

    validates_attachment :photo,
                         content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                         #limited the size of img
                         size: { in: 0..5000.kilobytes }

    #paperclip memo: http://qiita.com/violetyk/items/ba07ce060febcd725db4
end
