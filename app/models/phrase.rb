class Phrase < ActiveRecord::Base
  attr_accessible :content, :user_id
  validates :user_id, presence: true
end
