class PaymentsController < ApplicationController
	def index
	    @payments = Payment.all	
	    @students = Student.all
	end

	def new
		@payment = Payment.new
		@course = Course.find(params[:format])
	end

	def create
		@payment = Payment.new(payment_params)
    @course = Course.load(params[:id])
		fees1 = params[:instalment]
		fees2 = params[:remaining]
    full_fees = params[:fees]
		@payment.save
		@payment.update!(instalment: fees1, remaining: fees2, student_id: current_user.student.id, fees: full_fees)

		redirect_to @payment
	end

	def confirm_to_pay
     @payment = Payment.find(params[:id])
     @student = current_user.student
     @payment.update_attributes(txnid: SecureRandom.hex(10))
     @payment = @student.payments.build(
        txnid: @payment.txnid,
        course_id: @payment.course_id,
        amount: @payment.instalment,
        email: current_user.student.email,
        status: 'will send request for payment'
      )
    @payment.save
  end

  def payu_return                                              
      notification = PayuIndia::Notification.new(request.query_string, options = {:key => 'gtKFFx', :salt => 'eCwWELxi', :params => params})    
      payment = Payment.find_by(txnid: notification.invoice)  # invoice is nothing but the payment_id
      if notification.params["status"] == "success"
        payment.status = params[:status]
        payment.unmappedstatus = params[:unmappedstatus]
        # payment.ip = request.remote_ip
        payment.name_on_card  = params[:name_on_card]
        payment.issuing_bank = params[:issuing_bank]
        payment.cardCategory = params[:card_type]
        payment.payment_mode = 'online'
        if payment.save
          @payment = payment
          flash[:notice] = "Payment Done successfully!!!"
          redirect_to payment
        end
      else
        flash[:notice] = "Payment fail!. Please try again"
        redirect_to payment    #show.html.erb
      end
    # rescue
    #   flash[:notice] = "something goes wrong ! please try again after some times!!!"
    #   redirect_to customer_path(current_user)
    # end
  end

	def show
		@payment = Payment.find(params[:id])
          respond_to do |format|
   		  format.html
   		  format.pdf do
       	render pdf: "show_payment.pdf.erb"   # Excluding ".pdf" extension.
     	end
   	  end
    end



    def show_payment
    	@payment = Payment.find(params[:id])
          respond_to do |format|
   		  format.html
   		  format.pdf do
       	render pdf: "show_payment.pdf.erb"   # Excluding ".pdf" extension.
     	end
   	  end
    end
	private

	def payment_params
		params.require(:payment).permit!
	end
end
