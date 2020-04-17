class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  # validates :release_year, presence:true, unless: :released_exists?
  # validates :release_year, numericality: {less_than_or_equal_to: Time.new.year}
  validates :artist_name, presence: true

  with_options if: :released_exists? do |song|
      song.validates :release_year, presence: true
      song.validates :release_year, numericality: {
        less_than_or_equal_to: Time.new.year
      }
  end

  private
  def released_exists?
    released
  end
end
