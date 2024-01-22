class Song
  attr_accessor :name, :album, :id

    def initialize name: , album:, id: nil
      @id = id #Initialize id because of the database
      @name = name
      @album = album

    end

    def self.create_table #This just creates the table and no data is inserted
      sql =  <<-SQL
         CREATE TABLE IF NOT EXISTS songs (
          id INTEGER PRIMARY KEY,
          name TEXT,
          album TEXT
         )
         SQL
      DB[:conn].execute(sql)
    end

    #To insert any data let's define an instance method
    #to save the attributes of that instance to the db

    def save
      sql = <<-SQL
      INSERT INTO songs (name, album)
      VALUES (?,?)
      SQL

      DB[:conn].execute(sql, self.name, self.album)
    end

    def self.create name: , album:
      song = Song.new name: name, album: album
      song.save
    end


end
