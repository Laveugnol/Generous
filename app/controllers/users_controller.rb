class UsersController < ApplicationController
  def create

    @user = User.new(user_params)

    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])

      from = '+33644604514' # Your Twilio number
      to = @user.phone.to_s # Your mobile phone number

      @client.messages.create(
      from: from,
      to: to,
      body: "Hey #{@user.name}, vous venez de nous appeler concernant votre police n:#{@user.policy}, Recommanderiez-vous notre entrprise à votre entourage? (échelle de 1 à 10)"
      )

     redirect_to root_path

  end


  def twilio_response
      @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])

      @messages = @client.messages.list
      @counter_overall = 0
      @counter =0
      @nps = 0

      @messages.each do |record|
        if record.direction == "inbound"
          if (1..10).include?(record.body.to_i)
            @nps += record.body.to_i
            @counter+=1
          end


        end
      end
      counter =@counter

      @average = @nps/counter

      # messages.each do |record|
      #   puts record.sid
      #   raise
  end


  def twilio_call

     @user = User.new(user_params)

    # Get your Account Sid and Auth Token from twilio.com/console
    account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    auth_token = 'your_auth_token'


     from = '+33644604514' # Your Twilio number
    to = @user.phone.to_s # Your mobile phone number

    # set up a client to talk to the Twilio REST API
     @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])

    call = @client.calls.create(
        to: '+33'+to,
        from: from,
        url: "http://demo.twilio.com/docs/voice.xml")
    call.to

       redirect_to root_path

  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :policy)
  end
end
