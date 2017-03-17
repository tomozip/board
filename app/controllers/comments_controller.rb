class CommentsController < ApplicationController

  before_action :set_my_thread, only: [:create, :edit, :update]
  before_action :set_comment, only: [:destroy, :edit, :update]

  def destroy
    # @いるのだろうか？
    @comment.destroy
    redirect_to my_thread_path(params[:my_thread_id])
  end

  def create
    # @comment = @my_thread.comments.new(comment_params)
    # if @comment.save 今回はエラーでもリダイレクト先が一緒
    @comment = @my_thread.comments.create(comment_params)
    redirect_to my_thread_path(params[:my_thread_id])
  end

  def edit
  end

  def update
    # やりたいけどmy_thread_idをフォームから取ってこれない。
    if @comment.update(comment_params)
      redirect_to my_thread_path(@my_thread.id)
    else
      render 'edit'
    end
  end

  private
    def comment_params
      params[:comment].permit(:content)
    end

    def set_my_thread
      @my_thread = MyThread.find(params[:my_thread_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

end
