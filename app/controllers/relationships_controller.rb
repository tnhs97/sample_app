class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :load_user, only: :create
  before_action :load_relationship, only: :destroy

  def create
    current_user.follow(@user)
    call_ajax
  end

  def destroy
    @user = @relationship.followed
    current_user.unfollow @user
    call_ajax
  end

  private

  def call_ajax
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def load_user
    return @user if @user = User.find_by(id: params[:followed_id])
    flash[:danger] = t "misc.user_not_exists"
    redirect_to root_path
  end

  def load_relationship
    return @relationship if @relationship = Relationship.find_by(id: params[:id])
    flash[:danger] = t "misc.relationship_not_exists"
    redirect_to root_path
  end
end
