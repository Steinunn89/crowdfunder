class ProjectsController < ApplicationController

def index
	@projects = Project.all
end

def new
	@project = Project.new
	# if projects.rewards // check
end

def create
	@project = Project.new(project_params)
	
	if @project.save

		redirect_to projects_url
		
	else
		render :new
	end
		
end

def show
	@project = Project.find(params[:id])
end


private

def project_params
	params.require(:project).permit(:name, :description, :start_date, :end_date, rewards_attributes: [:amount, :description, :_destroy])
	
end
end
