require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets

  has_many :subscribes , class_name: "Follow", foreign_key: "follower_id"

  has_many :followings, class_name: "Follow", foreign_key: "subscribed_to_id"

  has_many :followers, :through => :followings

  has_many :subscriptions, :through => :subscribes, :source => :subscription


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

# has_many :subordinates, class_name: "Employee",
#                           foreign_key: "manager_id"


# has_many :subscriptions, :foreign_key => "follower_id", :class_name => "Follow"           , :dependent => :destroy
# has_many :users_subscribers, :through => :follows, :source => :subscribed_to_id

# has_many :followers, :foreign_key => "subscribed_to_id", :class_name => "Follow"            , :dependent => :destroy
# has_many :users_followers, :through => :followings, :source => :follower_id

