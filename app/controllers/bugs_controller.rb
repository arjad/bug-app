class BugsController < ApplicationController
    load_and_authorize_resource
    def index
        @bugs = current_user.projects.find(params[:project_id]).bugs
    end
    def show
        @showbug = Bug.find(params[:id])
    end
    def new
        # @bug = current_user.projects.find(params[:project_id]).bugs.new
        @bug = Project.find(params[:project_id]).bugs.new
        @project = Project.find(params[:project_id])

    end
    def create
        #ihave to change bug.new in new form
        @bug = Project.find(params[:project_id]).bugs.create(bugs_paramsupdate)
        if @bug.save
            redirect_to project_bugs_path, :notice => "bug is saved"
        else
            render "new"
        end
    end
    def edit
        @editbug = current_user.projects.find(params[:project_id]).bugs.find(params[:id])
        @project = Project.find(params[:project_id])
    end
    def update
        @editbug = current_user.projects.find(params[:project_id]).bugs.find(params[:id])
        @editbug.update(bugs_paramsupdate)

        redirect_to project_bugs_path, :notice => "updated"
    end
    def destroy
        @editbug = Project.find(params[:project_id]).bugs.destroy(params[:id])
        redirect_to project_bugs_path, :notice => "deleted"
    end
    private
    def bugs_paramsupdate
        params.require(:bug).permit(:id, :title, :des, :bugtype, :status, :deadline, :resolver_id, :creator_id, :screenshot, :remote_screenshot_url).merge(creator_id: current_user.id)
    end
end