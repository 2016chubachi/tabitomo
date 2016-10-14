class Message < ActiveRecord::Base
    
    #送信者リレーション
    belongs_to :send_member , :class => "Member" , :foreign_key => "sender"
    #受信者リレーション
    belongs_to :receive_member , :class => "Member" , :foreign_key => "receiver"
    
end
