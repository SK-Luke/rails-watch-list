require 'open-uri'
require 'json'

puts "destroying database"

Movie.destroy_all
Bookmark.destroy_all
List.destroy_all

puts "creating database..."

10.times do
  data = JSON.parse(URI.open("https://tmdb.lewagon.com/movie/#{rand(1..999)}").read)
  movie = Movie.new(
    title: data["original_title"],
    overview: data["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{data["poster_path"]}",
    rating: data["vote_average"]
  )

  movie.save
end

puts "added movies"
