# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many(:posts, class_name: "Post", foreign_key: "board_id")

  has_many(:active_posts, -> {   where("expires_on <= ?", Date.today) }, class_name: "Post", foreign_key: "board_id")

  has_many(:expired_posts, -> {   where("expires_on > ?", Date.today) }, class_name: "Post", foreign_key: "board_id")

end
