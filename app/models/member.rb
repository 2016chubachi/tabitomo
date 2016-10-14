class Member < ActiveRecord::Base
    belongs_to :country
    
    has_many :booking_comments
    has_many :member_pictures
    #送信メッセージリレーション
    has_many :send_msgs , :class => "Message" , :foreign_key => "sender"
    #受信メッセージリレーション
    has_many :receive_msgs , :class => "Message" , :foreign_key => "receiver"
    has_one :traveler
    has_one :guide
end
