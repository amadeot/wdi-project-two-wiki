require_relative "../config"

class CreateCategories < ActiveRecord::Migration
  def up
    puts "this worked up"
    create_table :categories do |t|
      t.string(:name)
    end
  end

  def down
    puts "this worked down"
    drop_table :categories
  end

end

CreateCategories.migrate(ARGV[0])