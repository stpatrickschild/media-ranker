class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
  def index
    @albums = Work.albums
    @books = Work.books
    @movies = Work.movies
  end

  # GET /works/1
 
  def show
  end

  def top_ten
  end


  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
 
  def create
    @work = Work.new(work_params)
      if @work.save
        flash.now[:success] = "Successfully created #{@work.category} #{@work.id}"
         render :show 
    
      else
        flash.now[:warning] = "A problem occurred: Could not create #{@work.category}"
        
         render :new 
      end
  
  end

  # PATCH/PUT /works/1
  
  def update
      if @work.update(work_params)
        redirect_to @work, notice: 'Work was successfully updated.' 
      else
         render :edit  
      end
  end

  # DELETE /works/1

  def destroy
    @work.destroy
      redirect_to works_url, notice: 'Work was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
    end
end
