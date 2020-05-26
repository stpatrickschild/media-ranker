class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
  def index
    @albums = Work.where(category: :album).sort{|a, b| b.votes.count <=> a.votes.count}
    @books = Work.where(category: :book).sort{|a, b| b.votes.count <=> a.votes.count}
    @movies = Work.where(category: :movie).sort{|a, b| b.votes.count <=> a.votes.count}
  end

  # GET /works/1
 
  def show
    work_id = params[:id]
    @work = Work.find_by(id: work_id)
    if @work.nil?
      head :not_found
      return
    end
  end

  def top_ten
    @spotlight = Work.spotlight
    @albums = Work.top_works(:album)
    @books = Work.top_works(:book)
    @movies = Work.top_works(:movie)
    # set @variable for the spotlight (this might be nil)
    # set @Variable for each catagory , restrict it to the atmost 10
  end


  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
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
        flash[:success] = "Work was successfully updated"
        redirect_to @work
        
      else
         render :edit  
      end
  end

  # DELETE /works/1

  def destroy
    @work.destroy
    flash[:success] = "Successfully destroyed #{@work.category} #{@work.id}"
    redirect_to root_path
      
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
