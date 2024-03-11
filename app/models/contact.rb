class Contact < ApplicationRecord
  DEFAULT_AVATAR_URL="https://robohash.org/quitotamnon.png?size=300x300&set=set1"

  belongs_to :patient, optional: true
end
