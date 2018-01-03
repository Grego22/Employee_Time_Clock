class PostPolicy < ApplicationPolicy
    def update?
        # Case 1 = User of record
        # Case 2 = Admin User
        record.user_id == user.id || admin_types.include?(current_user.try(:type))
        ## only the user that created the post should edit it
      end
    end

    ## everytime application policy is called it initializes a user and a record
    ## inherited from application policy