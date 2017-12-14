class UserMailer < ApplicationMailer

	default from: 'demo.qset@gmail.com'

def new_message(message)
   @message = message  
   mail subject: "Message from #{message.name}"
 end
end
