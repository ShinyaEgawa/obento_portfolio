class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: %i[destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = '投稿しました!'
      redirect_to root_path
    else
      @feed_items = []
      render 'top_pages/home'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comment = Comment.new
    @user = User.find_by(id: @micropost.user_id)
  end

  def destroy
    @micropost.destroy
    flash[:success] = '投稿の削除に成功しました'
    redirect_to request.referer || user_path(current_user)
  end

private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to user_path(current_user) if @micropost.nil?
  end
end
