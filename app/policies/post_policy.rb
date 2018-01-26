class PostPolicy < ApplicationPolicy

  def update?
      return true if post_approved? && admin?
      return true if user_or_admin && !post_approved?
      ## only the user that created the post should edit it
  end

  def approve?
    admin?
  end

  private

    def user_or_admin
      record.user_id == user.id|| admin?
    end

    def admin?
      admin_types.include?(user.type)
    end

    def post_approved?
      record.approved?
    end
end

    ## everytime application policy is called it initializes a user and a record
    ## inherited from application policy