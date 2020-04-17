class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence:true, if: :released_exists?
  validates :release_year, presence:false, if: !:released_exists?
  validates :release_year, numericality: {less_than_or_equal_to: Time.new.year}
  validates :artist_name, presence: true

  private
  def released_exists?
    self.released==true
  end

  # def once_a_year
  #   @copy = Song.find_by_title(title)
  #   if @copy
  #     if (@copy.artist_name == artist_name) && (@copy.release_year == release_year)
  #       errors[:base] << "Artist cannot release the same song in one year!"
  #     end
  #   end
  # end
end
