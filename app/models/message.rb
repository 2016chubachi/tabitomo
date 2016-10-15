class Message < ActiveRecord::Base
    #送信者リレーション
    belongs_to :sender ,:class_name => "Member" , foreign_key: "sender_id"
    #受信者リレーション
    belongs_to :receiver ,:class_name => "Member" ,foreign_key: "receiver_id"

end
