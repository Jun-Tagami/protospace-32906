class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      # ↓コメントに紐づくプロトタイプ
      @prototype = @comment.prototype
      # ↓プロトタイプに紐づくコメント一覧
      @commnets = @prototype.comments
      render "prototypes/show"
    end
  end


  def show
    comment = Comment.new
    #ピックツイートのTweetsコントローラーのShowアクションで使われているset_tweerプライベートメソッドの@tweetを真似する
    @prototype = Prototype.find(params[:prototype_id])
    @comments = @prototype.comments.includes(:user)
  end

 private

  def comment_params
  params.require(:comment).permit(:text).merge(user_id:current_user.id , prototype_id:params[:prototype_id])
  end

end