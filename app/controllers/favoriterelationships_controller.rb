class FavoriterelationshipsController < ApplicationController
    def create
        @micropost = Micropost.find(params[:fuser_id])
        current_user.favorites(@micropost)
        #@favorite = current_user.favorites.build(favorite) #現在のユーザーとお気に入りを結びつける
        #@micropost = Micropost.find(params[:user_id]) #お気に入りに登録したmicropostのコメント
    end
    
    def destroy
        @micropost = current_user.favoritter_relationships.find_by!(micropost_id: params[:id]).favorited
        current_user.unfavorites(@micropost)
    end
end
