class ClipsController < ApplicationController
  before_action :set_clip, only: [:show, :edit, :update, :destroy]

  # GET /clips
  def index
    @clips = Clip.all
  end

  # GET /clips/1
  def show
  end

  # GET /clips/new
  def new
    @clip = Clip.new
  end

  # GET /clips/1/edit
  def edit
  end

  # POST /clips
  def create
    @clip = Clip.new(clip_params)

    if @clip.save
      redirect_to @clip, notice: 'Clip was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /clips/1
  def update
    if @clip.update(clip_params)
      redirect_to @clip, notice: 'Clip was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /clips/1
  def destroy
    @clip.destroy
    redirect_to clips_url, notice: 'Clip was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clip
      @clip = Clip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clip_params
      params.require(:clip).permit(:url)
    end
end
