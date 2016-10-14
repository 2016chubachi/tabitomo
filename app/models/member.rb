class Member < ActiveRecord::Base
    belongs_to :country
    
    has_many :booking_comments
    has_many :member_pictures
    #受信メッセージリレーション
    has_many :in_msgs , :class => "Message" , :foreign_key => :receiver
    #送信メッセージリレーション
    has_many :out_msgs , :class => "Message" , :foreign_key => :sender
    has_one :traveler
    has_one :guide
end
