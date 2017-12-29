class PostPolicy < ApplicationPolicy
    def update?
        record.user_id == user.id
        ## only the user that created the post should edit it
      end
    end

    ## everytime application policy is called it initializes a user and a record
    ## inherited from application policy