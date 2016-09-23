class User < ApplicationRecord
  has_secure_password
  validates :password, 
            :length => { :in => 4..24 }, 
            :allow_nil => true
has_many :posts
has_many :comments

has_attached_file :avatar, :styles => { :medium => "50x50", :thumb => "25x25" }
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


has_many :initiated_friendings, :foreign_key => :friender_id,
                                :class_name => "Friending"
has_many :friended_users,       :through => :initiated_friendings,
                                :source => :friend_recipient


has_many :received_friendings,  :foreign_key => :friend_id,
                                :class_name => "Friending"
has_many :users_friended_by,    :through => :received_friendings,
                                  :source => :friend_initiator
end
