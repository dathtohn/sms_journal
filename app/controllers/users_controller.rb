class UsersController < ApplicationController
  before_filter :signed_in_user,  only: [:edit, :update]
  before_filter :correct_user,    only: [:edit, :update]

	def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Thank you! You will receive an SMS shortly with verification instructions."
    
      # Instantiate a Twilio client
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      
      # Create and send an SMS message
      # client.account.sms.messages.create(
      #   from: TWILIO_CONFIG['from'],
      #   to: @user.phone,
      #   body: "Thanks for signing up. To verify your account, please reply HELLO to this message."
      # )

      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    # do not need because of the before_filter correct_user
    # @user = User.find(params[:id])
  end

  def update
    old_phone = @user.phone
    old_email = @user.email
    if @user.update_attributes(params[:user])
      # check flash notices
      flash[:success] = "Changes saved."
      if @user.phone != old_phone
        @user.verified = false
        flash[:success] << " You will receive a verification text shortly."
      end
      if @user.email != old_email
        @user.verified = false
        flash[:success] << " You will receive a verification email shortly."
      end
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
