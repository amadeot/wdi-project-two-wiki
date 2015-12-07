require_relative "../config"

class CreateUsers < ActiveRecord::Migration
  def up
    puts "this worked up"
    create_table :users do |t|
      # all the column names and types go here
      # ids are made for us
      t.string(:password_digest)
      t.string(:username)
      t.string(:email)
    end
  end

  def down
    puts "this worked down"
    drop_table :users
  end

end


CreateUsers.migrate(ARGV[0])
