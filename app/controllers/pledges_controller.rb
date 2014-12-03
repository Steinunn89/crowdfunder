class PledgesController < ApplicationController
	before_filter :load_project

	def new
		@pledge = Pledge.new(amount: params[:amount])
		@reward = @project.match_reward(@pledge.amount)
	end

	def create
		@pledge = @project.pledges.build(pledge_params)
		
		if @pledge.save

			redirect_to projects_path
			
		else
			render :new
		end
	end
	def show
		@pledge = Pledge.find(params[:id])
	end

	def load_project
		@project = Project.find(params[:project_id])	
	end


private
	def pledge_params
		params.require(:pledge).permit(:amount)
	end

end
