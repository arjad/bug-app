class BugsController < ApplicationController
    # skip_before_action :verify_authenticity_token

    #see all bugs of that specific project
    def index
        @bugs = Project.find(params[:project_id]).bugs
    end
    #see one
    def show
        @showbug = Bug.find(params[:id])

    end
    #new form
    def new
        @bug = current_user.projects.find(params[:project_id]).bugs.new
    end
    #creating
    def create
        #ihave to change bug.new in new form
        @newbug = Project.find(params[:project_id]).bugs.create!(bugs_paramsupdate)

        if @newbug.save
            redirect_to project_bugs_path, :notice => "bug is saved"
        else
            render "new"
        end
    end

    #edit form
    def edit
        @editbug = current_user.projects.find(params[:project_id]).bugs.find(params[:id])
        @project = Project.find(params[:project_id])
    end

    def update
        @editbug = current_user.projects.find(params[:project_id]).bugs.find(params[:id])
        @editbug.update(bugs_paramsupdate)

        redirect_to project_bugs_path, :notice => "updated"
    end
    #delete one
    def destroy
        @editbug = Project.find(params[:project_id]).bugs.destroy(params[:id])
        redirect_to project_bugs_path, :notice => "deleted"
    end

    private
    def bugs_params
        params.require(:bug).permit(:id, :title, :des, :bugtype, :deadline, :status, :creator_id, :resolver_id, :screenshot, :remote_screenshot_url)
    end

    def bugs_paramsupdate
        params.require(:bug).permit(:id, :title, :des, :bugtype, :status, :deadline, :creator_id, :resolver_id, :screenshot, :remote_screenshot_url).merge(creator_id: current_user.id)
    end
end
