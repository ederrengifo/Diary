class CommentsController < ApplicationController
  before_action :set_timeline
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @timeline.comments.all
    @comments = @timeline.comments.order('messages.created_at ASC')
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @timeline.comments.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @timeline.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to timelines_url, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @timeline, notice: 'Comment has been not created.' }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comments = @timeline.comments.order('comments.created_at DESC')
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @timeline, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to timelines_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @timeline.comments.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment_content, :user_id, :comment_id)
    end

    def set_timeline
      @timeline = Timeline.find(params[:timeline_id])
    end
end
