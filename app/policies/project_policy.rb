class ProjectPolicy < ApplicationPolicy

  def create?
    user.manager?
  end

  def show?

    (record.creator_id ==user.id) || (user.qa? )|| (user.developer?)
  end

  def update?
  	#byebug
   record.creator_id ==user.id
  end


  def destroy?
    update?
  end

  def edit?
   	update?
  end

  def add_user?
    update?
  end

  def remove_user?
   	update?
  end
  

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.manager?
      	scope.where(creator_id: user.id)
      elsif user.qa?
      	scope.all
      elsif user.developer?
        scope = @user.projects
          
      end   
    end
  end




end
