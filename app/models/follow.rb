class Follow < ActiveRecord::Base
 belongs_to :follower, :class_name => "User"
 belongs_to :subscription, :class_name => "User", :foreign_key => 'subscribed_to_id'
end
