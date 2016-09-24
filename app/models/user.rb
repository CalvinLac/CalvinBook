class User < ApplicationRecord
  has_secure_password
  validates :password, 
            :length => { :in => 4..24 }, 
            :allow_nil => true
has_many :posts
has_many :comments

has_attached_file :avatar, 
:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
:url => "/system/:attachment/:id/:basename_:style.:extension",
:styles => {
  :thumb    => ['100x100#',  :jpg, :quality => 70],
  :preview  => ['480x480#',  :jpg, :quality => 70],
  :large    => ['600>',      :jpg, :quality => 70],
  :retina   => ['1200>',     :jpg, :quality => 30]
},
:convert_options => {
  :thumb    => '-set colorspace sRGB -strip',
  :preview  => '-set colorspace sRGB -strip',
  :large    => '-set colorspace sRGB -strip',
  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
}
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


has_many :initiated_friendings, :foreign_key => :friender_id,
                                :class_name => "Friending"
has_many :friended_users,       :through => :initiated_friendings,
                                :source => :friend_recipient


has_many :received_friendings,  :foreign_key => :friend_id,
                                :class_name => "Friending"
has_many :users_friended_by,    :through => :received_friendings,
                                  :source => :friend_initiator

searchable do
    text :username, :email
end

end
