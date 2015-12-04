class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :users, through: :editors
end