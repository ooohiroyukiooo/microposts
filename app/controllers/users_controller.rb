class UsersController < ApplicationController
  
  def show # 追加
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit
     @user = User.find(current_user)
  end
  
  def update
     @user = User.find(current_user)
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: '基本情報を編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

=begin
  def followings
    @user = User.find(params[:id])
    @followings = @user.following_users
    #@followings = current_user.following_users　自分のフォロー、フォロワーの取得ならこれでOK!
  end
  
  def followers
    @user = User.find(params[:id])
    @followed = @user.followed_users
    #@followed = current_user.followed_users　自分のフォロー、フォロワーの取得ならこれでOK!
  end
=end
  
  def favorites
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
