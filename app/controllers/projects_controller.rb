class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /projects
  # GET /projects.json
  
  def index
    #@projects = policy_scope(Project)
     @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
     #@project = Project.find(params[:id])
  #@users =User.where.not(id: @project.users.ids)
  #@project.users << @users

end

  # GET /projects/new
  def new
    @project = Project.new
    # @project = current_user.created_projects.build
    #  respond_to do |format|
    # format.html {redirect_to project_path}
    # format.js
  #end
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
  #@project = current_user.projects.new(project_params)
  #@project = current_user.created_projects.build(project_params)
  @project = current_user.build(project_params)
  #@project.user=current_user.id
  #@project = Project.new(project_params)
    respond_to do |format|
        if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end



    def adduser
      # @project = Project.find(params[:id])
      # #@user= User.find(params[:user_id])
      # #logger.info "info{params[:user_id]}"
      
      
      # @project.users << @users
   
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
      #@project = current_user.created_projects.find_by(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description)
    end
    
  

end
