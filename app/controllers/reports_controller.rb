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
end
