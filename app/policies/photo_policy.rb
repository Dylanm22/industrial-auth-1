class PhotoPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def show?
    user == photo.owner ||
    !photo.owner.private? ||
    photo.owner.followers.include?(user)
  end

  def edit?
   update?
  end


  def update?
    user == photo.owner
  end

  def destroy?
    user == photo.owner
  end
  
  def new?
    true
  end
  
  def create?
    true
  end

end
