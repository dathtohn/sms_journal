class TopicsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, only: [:create, :destroy]

  def new
    @topic = Topic.new
  end

  def create
  	@topic = Topic.new(params[:topic])
    @users = User.all
  	if @topic.save
      
      @users.each do |user|
        client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
        
        # Create and send an SMS message
        client.account.sms.messages.create(
          from: TWILIO_CONFIG['from'],
          to: user.phone,
          body: @topic.content + " " + topics_url
        )
      end

      flash[:success] = "Topic created and texts sent out!"
      redirect_to topics_url
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
  end

  def index
    @topics = Topic.all
  end

  def edit
    @topic = Topic.find(params[:id]) 
  end

  def update
  end

  def destroy
    Topic.find(params[:id]).destroy
    flash[:success] = "Topic destroyed."
    redirect_to topics_url
  end
end