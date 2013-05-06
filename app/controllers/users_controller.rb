class UsersController < ApplicationController

	def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
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

end
