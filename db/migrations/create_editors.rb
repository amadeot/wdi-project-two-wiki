require_relative "../config"

class CreateEditors < ActiveRecord::Migration
  def up
    puts "this worked up"
    create_table :editors do |t|
      t.references(:user)
      t.references(:article)
      t.datetime(:updated_at)
    end
  end

  def down
    puts "this worked down"
    drop_table :articles
  end

end

CreateEditors.migrate(ARGV[0])