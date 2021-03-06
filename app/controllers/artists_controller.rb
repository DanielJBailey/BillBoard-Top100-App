class ArtistsController < ApplicationController
  before_action :set_artist, except: [:index, :new, :create]
  
  def index
    @artists = Artist.all
  end

  def show
    @songs = @artist.songs.all
    @board = Board.find(params[:board_id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def edit
    #render :edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path
    else
      render :edit
    end
  end

  private
    def artist_params
      params.require(:artist).permit(:name)
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end
end
