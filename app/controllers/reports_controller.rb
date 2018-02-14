class ReportsController < ApplicationController
	def report
	end

	def select
      @payment_type = params[:payment_payment]
      if @payment_type == 'Offline'
      	@payments = Payment.list1
      elsif @payment_type == 'Online'
      	@payments = Payment.list2
      else
        @payments = Payment.all
      end
    end

    def reference_report
      @students = Student.reference_report
    end

    def select_reference
      @student = Student.load(params[:student_id])
      @references = @student.users
    end
end
