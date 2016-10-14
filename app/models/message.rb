class Message < ActiveRecord::Base
    
    #送信者リレーション
    belongs_to :send_member , :class => "Member" , :foreign_key => "sender", :foreign_type => "integer"
    #受信者リレーション
    belongs_to :receive_member , :class => "Member" , :foreign_key => "receiver", :foreign_type => "integer"
    
end
