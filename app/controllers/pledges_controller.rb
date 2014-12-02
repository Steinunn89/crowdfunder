class PledgesController < ApplicationController
def new
	@pledge = Pledge.new
end

def create
	@pledge = pledge.new(pledge_params)
	
	if @pledge.save

		redirect_to pledges_url
		
	else
		render :new
	end
end
def show
	@pledge = Pledge.find(params[:id])
end

end
