class WikiPolicy < ApplicationPolicy
    class Scope < Scope
        attr_reader :user, :scope
        
        def initialize(user, scope)
            @user  = user
            @scope = scope
        end
        
        def resolve
            if user.admin? || user.premium?
                scope.all
            else
                scope.where("private IS NULL or private == ?", false)
            end
        end
    end
end 