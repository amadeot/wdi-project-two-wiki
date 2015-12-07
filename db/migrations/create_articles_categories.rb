require_relative "../config"

class CreateArticlesCategories < ActiveRecord::Migration
  def up
    puts "this worked up"
    create_table :articles_categories do |t|
      t.references(:article)
      t.references(:category)
    end
  end

  def down
    puts "this worked down"
    drop_table :articles_categories
  end

end

CreateArticlesCategories.migrate(ARGV[0])