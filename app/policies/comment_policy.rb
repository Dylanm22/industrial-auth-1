class CommentPolicy < ApplicationPolicy
 attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end
 def create?
      true
 end

  def update?
    user == comment.author
  end

  def edit?
    update?
  end

  def destroy?
  user == comment.author
  end

end
