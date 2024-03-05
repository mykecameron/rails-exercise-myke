class AvatarComponent < ViewComponent::Base
  def initialize(avatar_url:)
    @avatar_url = avatar_url
  end

end
