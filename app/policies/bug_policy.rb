class BugPolicy < ApplicationPolicy

  def create?
    user.qa?
  end

  def show?
    (record.creator_id ==user.id) 
  end


  def destroy?
    show?
  end

 
  def assign_dev?
   user.developer? 
  end

 
  def remove_dev?
   user.developer? 
  end

  def started?
   	(user.developer?) && (record.developer_id ==user.id)
  end
  
  def done?
    started?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      	scope.all
         
    end
  end




end
