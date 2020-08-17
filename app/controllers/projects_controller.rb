class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :add_user, :remove_user]
  append_before_action :authorize_project,  except: [:index, :new, :create]
  after_action :verify_policy_scoped, only: :index

  def index
    @projects = policy_scope(Project)
  end

  def show
    @users = User.all
  end

  def new
    @project = Project.new

    authorize_project
  end

  def create
    @project = current_user.created_projects.build(project_params)

    authorize @project

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy

    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  def add_user
    @user = User.find(params[:user_id])
    @project.users << @user

    redirect_to project_path(@project)
  end

  def remove_user
    @user = User.find(params[:user_id])

    @bugs = @project.bugs.where(developer_id: @user.id)

    @bugs.each do |b|
      b.developer_id = nil
      b.save
    end

    @project.users.destroy(@user)

    redirect_to project_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def authorize_project
    if @project.present?
      authorize @project
    else
      authorize Project
    end
  end
end
