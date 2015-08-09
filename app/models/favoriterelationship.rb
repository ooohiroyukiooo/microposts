class Favoriterelationship < ActiveRecord::Base
  belongs_to :micropost, class_name: "Micropost"
  belongs_to :fuser, class_name: "User"
end
