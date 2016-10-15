class Member < ActiveRecord::Base
    belongs_to :country

    has_many :booking_comments
    has_many :member_pictures
    #送信メッセージリレーション
    has_many :senders ,:class_name => "Message" , foreign_key: "sender_id"
    #受信メッセージリレーション
    has_many :receivers ,:class_name => "Message" ,foreign_key: "receiver_id"
    has_one :traveler
    has_one :guide
end
