class ListPolicy < ApplicationPolicy

  def index?
    user.present?
  end
  
 class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.present?
        scope.all
      else
        scope.none
      end
    end
  end
end