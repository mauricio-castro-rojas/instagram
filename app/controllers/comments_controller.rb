class CommentsController < ApplicationController
  before_action :get_post
  before_action :set_comment, only: %i[ update destroy ]

  # GET /comments or /comments.json
  def index
    @comment = @post.comments
    #redirect_to post_path(@post)
  end

  # GET /comments/1 or /comments/1.json
  def show

  end

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to account_post_path(:id => @post.id), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  #def create

    #@comment = @post.comments.build(comment_params)

    #respond_to do |format|
      #if @comment.save
        #format.html { redirect_to post_comments_path(@post), notice: "Comment was successfully created." }
        #format.json { render :show, status: :created, location: @comment }
        #else
        #format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
        #end
      #end
    #end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_comment_path(@post), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_comments_path(@account), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_post
      @post = Post.find(params[:post_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      #debugger
      params.require(:comment).permit(:text, :post_id, :account_id)
    end
end
