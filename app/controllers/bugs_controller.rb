class BugsController < ApplicationController

	before_action :set_bug, only: [:show, :edit, :update, :destroy]
  	before_action :find_project
  # GET /projects
  # GET /projects.json
  
  def index
    #@projects = policy_scope(Project)
     @bug = Bug.all
  end


  def show
  end

  
  def new
     @bug = current_user.created_bugs.build
  end

  
  def edit
  end


  def create

  @bug = current_user.created_bugs.build(bug_params)
    respond_to do |format|
        if @bug.save
        format.html { redirect_to project_bugs_path(@project), notice: 'Bug was successfully created.' }
        
      else
        format.html { render :new }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to project_bugs_path(@project), notice: 'Project was successfully updated.' }
        
      else
        format.html { render :edit }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to project_bugs_path(@project), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end



    # def add_user
    #   @project = Project.find(params[:id])
    #   @user= User.find(params[:user_id])
    #   @project.users << @user
    #   redirect_to (request.referrer)
    #    #redirect_to @project
    # end
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
      params.require(:bug).permit(:title, :deadline, :screenshot, :type, :status)
    end
    
  

end