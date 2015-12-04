class Editor < ActiveRecord::Base
  belongs_to :users
  belongs_to :articles
end