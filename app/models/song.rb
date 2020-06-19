class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.save
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.save
  end

  def genre_name
    self.genre.name if self.genre
  end

  def notes_content=(contents)
    contents.each do |content|
      unless content.empty?
        note = Note.create(content: content)
        self.notes << note
      end
    end
  end

  def notes_content
    self.notes.collect {|note| note.content}
  end

end
