require_relative "../config"

class CreateArticles < ActiveRecord::Migration
  def up
    puts "this worked up"
    create_table :articles do |t|
      t.string(:header)
      t.string(:body_text)
      t.references(:user)
      t.datetime(:created_at)
      t.datetime(:updated_at)
    end
  end

  def down
    puts "this worked down"
    drop_table :articles
  end

end

CreateArticles.migrate(ARGV[0])