class Message < ActiveRecord::Base
    #送信者リレーション
    belongs_to :sender ,:class_name => "Member" , foreign_key: "sender_id"
    #受信者リレーション
    belongs_to :receiver ,:class_name => "Member" ,foreign_key: "receiver_id"
    validates :title, :content, presence: true
    validates :title, length: { maximum: 200 }

    scope :readable_for, ->(member) {
    member ? all : where(member_only: false) }

    attr_accessor :member_only

    # private
    #
    # class << self
    #   def sidebar_articles(member, num = 5)
    #     open.readable_for(member).order(released_at: :desc).limit(num)
    #   end
    # end
end
