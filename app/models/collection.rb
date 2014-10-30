# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  album_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Collection < ActiveRecord::Base
end
