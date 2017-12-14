class EnquiriesController < ApplicationController
  def index
  	@enquiries = Enquiry.all
  end

  def new
  	@enquiry = Enquiry.new
  end

  def 

  def create
  	@enquiry = Enquiry.new(enquiry_params)
 
    respond_to do |format|
      if @enquiry.save
        # Tell the enquiryMailer to send a welcome email after save
        UserMailer.welcome_email(@enquiry).deliver_now
 
        format.html { redirect_to @enquiry, notice: 'enquiry was successfully created.' }
        format.json { render json :show, @enquiry, status: :created, location: @enquiry }
      else
        format.html { render action: 'new' }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

def update
	respond_to do |format|
	if @enquiry.update(enquiry_params)

        format.html { redirect_to(@enquiry, notice: 'enquiry was successfully created.') }
        format.json { render json: @enquiry, status: :created, location: @enquiry }
      else
        format.html { render :edit }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end

end

def destory
	@enquiry.destory
	respond_to do |format|
        format.html { redirect_to(@enquiry, notice: 'enquiry was successfully created.') }
        format.json { head :no_containt}
    end
end

private
def set_enquiry
	@enquiry = Enquiry.find(params[:id])
end

def enquiry_params
	params.require(:enquiry).permit(:name, :email, :subject, :message)
	
end

end
