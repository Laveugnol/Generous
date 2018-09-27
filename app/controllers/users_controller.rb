class UsersController < ApplicationController
  def create

    @user = User.new(user_params)

    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])



from = '+33644604514' # Your Twilio number
to = @user.phone.to_s # Your mobile phone number

@client.messages.create(
from: from,
to: to,
body: "Hey #{@user.name}, ça fonctionne biloute ! ton numero de police est le #{@user.policy}"
)

     redirect_to root_path

  end


  def twilio_response
      @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])

      @messages = @client.messages.list

      # messages.each do |record|
      #   puts record.sid
      #   raise



  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :policy)
  end
end
