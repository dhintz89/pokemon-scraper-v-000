class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  
  def alter_hp(hp,db)
    db.execute("UPDATE Pokemon SET hp = ? WHERE id=?", hp, self.id)
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?,?)", [name, type])
  end
  
  def self.find(id, db)
    pokemon=db.execute("SELECT * FROM Pokemon WHERE id=?",[id]).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end
  
end
