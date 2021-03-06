class Notifier < ActionMailer::Base
  def activation_instructions(user)
      subject       "Activation Instructions"
      recipients    user.email
      sent_on       Time.now
      body          :account_activation_url => register_url(user.perishable_token)
    end

    def activation_confirmation(user)
      subject       "Activation Complete"
      recipients    user.email
      sent_on       Time.now
      body          :root_url => root_url
    end
  

end
