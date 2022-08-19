class ProjectsController < ApplicationController
    load_and_authorize_resource

    def index
        @myprojects = current_user.projects
    end
    def show
        @oneproject = Project.find(params[:id])
    end

    def new
        @project = current_user.projects.new
    end

    def create
        byebug
        @project = current_user.projects.create!(projects_params)
       
        if @project.save
            redirect_to projects_path, :notice => " saved"
        else
            render "new"
        end
    end
    def edit 
        @project = current_user.projects.find(params[:id])
    end
    def update
        @project = current_user.projects.find(params[:id])
        @uid = params[:user_ids]
        #adding manager id to aray
        @uid.append(current_user.id)
        @project.update(title:params[:project][:title], description:params[:project][:description], user_ids: @uid)

        redirect_to projects_path, :notice => "updated"
    end

    def destroy
        @project = current_user.projects.destroy(params[:id])
        redirect_to projects_path, :notice => "deleted"
    end
   
    private
    def projects_params
        params.require(:project).permit(:title, :description).merge(user_ids: params[:user_ids])

    end
end
  