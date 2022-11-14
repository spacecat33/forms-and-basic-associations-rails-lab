class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre 
  has_many :notes

  def artist_name
    # getter method that returns the artist name 
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    # setter method that sets the artist to the artist of the specified name
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    # getter method that returns an array with the contents for all the song notes
    notes = []
      self.notes.each do |note|
        notes << note.content
      end
    notes
  end

  def note_contents=(notes)
    # setter method that takes an array of note content strings and assigns new notes with that content to the song
    notes.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes << note
    end
  end
end
