class Comment < ActiveRecord::Base
  attr_accessible :body
  validate :post, presence: true

  belongs_to :post
end
