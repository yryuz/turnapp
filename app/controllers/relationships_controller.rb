class RelationshipsController < ApplicationController

  def create
    @other_user = User.find(params[:follower])
    current_user.follow(@other_user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
     
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
      
  end

end
