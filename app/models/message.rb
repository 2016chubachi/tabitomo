class Message < ActiveRecord::Base
    
    #送信者リレーション
    #belongs_to :out_msg , :class => "Member" , :primary_key => :sender
    #受信者リレーション
    #belongs_to :in_msg , :class => "Member" , :primary_key => :receiver
    
end
