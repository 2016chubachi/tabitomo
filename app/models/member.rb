class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
    belongs_to :country

  attr_accessor :hantei

    has_one :member_picture, dependent: :destroy
    accepts_nested_attributes_for :member_picture, allow_destroy: true
    #送信メッセージリレーション
    has_many :senders ,:class_name => "Message" , foreign_key: "sender_id"
    #受信メッセージリレーション
    has_many :receivers ,:class_name => "Message" ,foreign_key: "receiver_id"
    has_one :traveler
    has_one :guide
end
