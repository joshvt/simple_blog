class Post < ActiveRecord::Base
  attr_accessible :content, :title

  validates :content, :title, presence: true
  validates :content, length: { maximum: 5000} 
  validates :title, length: { maximum: 100} 
end
