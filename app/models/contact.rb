class Contact < ApplicationRecord
  DEFAULT_AVATAR_URL="https://robohash.org/quitotamnon.png?size=300x300&set=set1"

  belongs_to :patient, optional: true

  def create_patient!(attributes = {})
    super({
      first_name: first_name,
      last_name: last_name,
      avatar_url: DEFAULT_AVATAR_URL,
    }.merge(attributes))
  end
end
