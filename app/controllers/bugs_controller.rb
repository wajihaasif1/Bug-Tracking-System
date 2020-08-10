class BugsController < ApplicationController

	before_action :set_bug, only: [:show, :edit, :update, :destroy, :assign_dev, :started, :done]
  before_action :find_project
  # GET /projects
  # GET /projects.json
  
  def index
     @bug = Bug.all
  end


  def show
  end

  
  def new
     @bug = @project.bugs.new
  end

  
  def edit
  end


  def create
  
    @bug = @project.bugs.build(bug_params)
    @bug.update(creator_id: current_user.id)
    @bug.save

    redirect_to project_path(@project)
    #redirect_to root_path

  end


  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to @bug, notice: 'bug was successfully updated.' }
        
      else
        format.html { render :edit }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@project), notice: 'bug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def assign_dev
    #byebug
    @bug.update(developer_id: current_user.id)
    
    redirect_to project_path(@project)
  end

  def started
   #byebug
    @bug.update_attributes(status: 'Started')
    redirect_to project_path(@project)
  end


    def done
      if(@bug.bug_type=='Bug')
        @bug.update_attributes(status: 'Resolved')
      elsif(@bug.bug_type=='Feature')
        @bug.update_attributes(status: 'Completed')
      end

      redirect_to project_path(@project)
    end

  private
 
  	def set_bug
      @bug = Bug.find(params[:id])
    end
   
    def find_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def bug_params
      params.require(:bug).permit(:title, :deadline, :screenshot, :bug_type, :status)
    end
end
