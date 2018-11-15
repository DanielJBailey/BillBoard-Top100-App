class SongsController < ApplicationController
  before_action :set_song, except: [:index, :new, :create]
  
  def index
    @songs = Song.all
  end

  def show
    #render :show
  end

  def new
    @song = Song.new()
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to artist_song_path(@artist, @song)
    else
      render :new
    end
  end

  def edit
    #render :edit
  end

  def update
    if @song.update(song_params)
      redirect_to artist_song_path(@artist, @song)
    else
      render :edit
    end
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:name)
    end
end
