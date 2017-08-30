class ArtistsController < ApplicationController
  before_action :set_artist, only: [:destroy, :edit, :update]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
  end


  def show
    @artist = Artist.find(params[:id])
  end

  def destroy
    @artist.destroy

    redirect_to artists_path
  end

  def update
    @artist.update(artist_params)

    redirect_to artist_path(@artist)
  end

  private

    def artist_params
      params.require(:artist).permit(:name, :image_path)
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

end
