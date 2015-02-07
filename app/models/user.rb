require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets


  # subscribes goes with subscriptions
  # followees goes with followers


  # assume 2 users:
  #     mau (Userobj) with id 10,
  #     james (Userobj) with id 20,
  #     follow (Followobj) with id=1 and entry user_id: 10 and subscribed_to_id: 20

  has_many :subscribes, class_name: "Follow", foreign_key: "user_id"    # key not needed but makes it more readable!
  has_many :followees, class_name: "Follow", foreign_key: "subscribed_to_id" # key not needed but makes it more readable!

  #  following is now possible:

  #  mau.subcribes      => followers object with id 1 (because mau user_id == follow.user_id)
  #  mau.followees      => empty array

  #  james.subscribes   => empty array
  #  james.followees    => followers object with id 1 (because james user_id == followers.subscribed_to_id)

  # but we dont want follow objects, we want the actual users.
  # note that #follower and #subscription are defined for follow object:

  # follow.follower     => mau (because follow.rb: line 2)
  # follow.subscription => james (because follow.rb: line 5)

  # Active Record can make use of this functionality by making the following association:

  has_many :subscriptions, :through => :subscribes # "through mau.subscribes"

  # remember how mau.subscribes returns a follow object with user_id = 10 and subscribed_to_id = 20 (which stores that mau is subscribed james)
  # and remember how in follow.rb follow.subscription points towards the user that is being subscribed to according this record?

  # mau.subscription gets the array of follow objects "through mau.subscribes", then gives you the corresponder user by doing follow.subscription on each of those objects.

  has_many :followers, :through => :followees   # through "james.followees"

  # remember how james.followees returns a follow object user_id = 10 and subscribed_to_id = 20 (which stores that mau is a followee of james)
  # and remember how in follow.rb follow.follower points toward the user that is a follower?

  # james.followers gets the array of follow objects through "james.followees", then gives you the corresponding user by doing follow.followees on each of those objects.

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

