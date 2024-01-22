require 'bundler'
Bundler.require

require_relative '../lib/song'

#We set up a constant DB that is equal to a hash
#containing a connection to our database

DB = { conn: SQLite3::Database.new("db/music.db") }

#We can access our connection in our song class like
# this DB[:conn]
