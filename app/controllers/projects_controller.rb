class ProjectsController < ApplicationController
    # skip_before_action :verify_authenticity_token

    #see all of that user(with id)
    def index
        @myprojects = current_user.projects
    end

    #show individual
    def show
        @oneproject = Project.find(params[:id])
    end

    #add project form 
    def new
        #instance of cur user proj, passed to new form
        @project = current_user.projects.new
    end

    #new_form submited to create
    def create
        @project = current_user.projects.create(projects_params)
       
        if @project.save
            redirect_to projects_path, :notice => " saved"
        else
            render "new"
        end
    end

    # form for update
    def edit 
        @project = current_user.projects.find(params[:id])
    end

    #actual update
    def update
        #get the project to edit
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
   
    #forbidden atrrubutes have now allowed
    private
    def projects_params
        params.require(:project).permit(:title, :description).merge(user_ids: params[:user_ids])
    end
end
  