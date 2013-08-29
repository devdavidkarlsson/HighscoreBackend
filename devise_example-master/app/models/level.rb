class Level < ActiveRecord::Base
  belongs_to :game#, ->{ includes :user_id }
  belongs_to :user
end
