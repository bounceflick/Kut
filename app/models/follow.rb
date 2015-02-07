class Follow < ActiveRecord::Base
 belongs_to :follower, :class_name => "User", :foreign_key => 'user_id' #(who are we talking about id)
 # will look for table "followers" with primary follower_id, but it is actually just the "users" table with primary key user_id. So we declare what table it is in, by pointing out the class name. Also, we point out the foreign key in this table that refers to user_id

 belongs_to :subscription, :class_name => "User", :foreign_key => 'subscribed_to_id'
 # same thing
end
