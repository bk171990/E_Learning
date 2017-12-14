class ReportsController < ApplicationController
	def report
	end

	def select
      @payment_type = params[:payment_payment]
      if @payment_type == 'Offline'
      	@payments = Payment.list1
      else
      	@payments = Payment.list2
      end
    end
end
