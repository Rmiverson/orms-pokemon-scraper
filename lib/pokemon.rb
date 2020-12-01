class Pokemon
   attr_accessor :name, :type
   attr_reader :id, :db


   def initialize(
      name:,
      type:,
      id: nil,
      db:
   )
      @name = name
      @type = type
      @id = id
      @db = db
   end

   def self.save(name, type, db)
      sql = <<-SQL
         INSERT INTO pokemon (name, type)
         VALUES (?, ?)
      SQL
      db.execute(sql, name, type)
   end

   def self.find(id, db)
      sql = <<-SQL
         SELECT *
         FROM pokemon
         WHERE id = ?
      SQL

      db.execute(sql, id).map do |row|
         self.new(id: id, name: row[1],type: row[2],db: db)
      end.first
   end

   # def self.new_from_db(row)
   #    new_pokemon = self.new
   #    new_pokemon.name = row[1]
   #    new_pokemon.type = row[2]
   #    new_pokemon.id = row[0]
   #    new_pokemon
   # end

end
