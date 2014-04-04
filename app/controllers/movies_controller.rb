class MoviesController < ApplicationController
  def index
    case
    when params[:query_title].present?
      @movies = Movie.where("title like ?", "%#{params[:query_title]}%")
    when params[:query_director].present?
      @movies = Movie.where("director like ?", "%#{params[:query_director]}%")
    else
      @movies = Movie.all
    
    end
  end


    
  #   else
  #     @movies = Movie.where("title like ?", "%#{params[:query]}%")
  #   end
  # end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path(@movie)
    else
      redirect :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path    
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image
    )
  end

end
