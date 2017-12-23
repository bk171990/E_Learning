class UserMailer < ApplicationMailer

	default to: 'demo.qset@gmail.com'

def new_message(message)
   @message = message  
   mail subject: "Message from #{message.name}"
 end
end
