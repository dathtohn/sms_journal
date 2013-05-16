class PostsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,  only: [:edit, :update]
  before_filter :admin_user,    only: :destroy

  def index
  end

  def new
    @topic = Topic.find(params[:topic_id])
  	@post = @topic.posts.build
  end

  def create
    @topic = Topic.find(params[:topic_id])
  	@post = @topic.posts.build
    @post.content = params[:content]
    @post.user = current_user
  	if @post.save
      flash[:success] = "Post created."
      redirect_to topics_url
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    @post.update_attribute(:content, params[:content])
    flash[:success] = "Post updated."
    redirect_to edit_topic_post_url(@topic, @post)
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post destroyed."
    redirect_to current_user
  end
end