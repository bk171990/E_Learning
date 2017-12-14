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
		@fees1 = params[:instalment]
		@fees2 = params[:remaining]
		
		@payment.save
		@payment.update!(instalment: @fees1, remaining: @fees2, student_id: current_user.student.id )
		redirect_to @payment

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
