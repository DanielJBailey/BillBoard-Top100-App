4.times do 
    board = Board.create(
            name: Faker::Music.genre
        )
    100.times do
        artist = board.artists.create(
            name: Faker::Music.band
        )
        5.times do
        artist.songs.create(
            name: Faker::Music.album
        )
        end
    end
end


