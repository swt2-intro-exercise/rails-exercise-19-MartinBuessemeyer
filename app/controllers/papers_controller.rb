class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]

  # GET /papers
  def index
    if params.permit(:year)[:year] != NIL and is_int(params.permit(:year)[:year])
      @papers = Paper.in_year(params.permit(:year)[:year])
    else
      @papers = Paper.all
    end
  end

  # GET /papers/1
  def show
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers
  def create
    @paper = Paper.new(paper_params)

    if @paper.save
      redirect_to @paper, notice: 'Paper was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /papers/1
  def update
    params = paper_params
    if @paper.update(params)
      redirect_to @paper, notice: 'Paper was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /papers/1
  def destroy
    @paper.destroy
    redirect_to papers_url, notice: 'Paper was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def paper_params
      params.require(:paper).permit(:title, :venue, :year, author_ids: [])
    end
    def is_int(string)
      num = string.to_i
      return num.to_s == string
    end
end
