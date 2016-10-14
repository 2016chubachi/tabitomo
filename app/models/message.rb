class Message < ActiveRecord::Base
    
    #送信者リレーション
    belongs_to :sender , :class => "Member" , :foreign_key => "sender"
    #受信者リレーション
    belongs_to :receiver , :class => "Member" , :primary_key => "receiver"
    
end
