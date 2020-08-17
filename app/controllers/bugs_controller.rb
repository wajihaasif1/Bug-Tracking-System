class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy, :assign_dev, :started, :done, :remove_dev]
  before_action :find_project
  append_before_action :authorize_bug,  except: [:index, :new, :create]

  def index
    @bugs = policy_scope(Bug)
  end

  def new
    @bug = @project.bugs.new

    authorize_bug
  end

  def show

  end

  def create
    @bug = @project.bugs.build(bug_params)
    @bug.creator_id = current_user.id
    @bug.save

    redirect_to project_path(@project)
  end

  def destroy
    @bug.destroy

    redirect_to project_url(@project), notice: 'bug was successfully destroyed.'
  end

  def assign_dev
    @bug.update!(developer_id: current_user.id)

    redirect_to project_path(@project)
  end

  def remove_dev
    @bug.update!(developer_id: nil)

    redirect_to project_path(@project)
  end

  def started
    @bug.update_attributes(status: 'Started')

    redirect_to project_path(@project)
  end

  def done
    if @bug.bug_type == 'Bug'
      @bug.update_attributes(status: 'Resolved')
    elsif @bug.bug_type == 'Feature'
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

  def authorize_bug
    if @bug.present?
      authorize @bug
    else
      authorize Bug
    end
  end
end
