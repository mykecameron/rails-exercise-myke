# WARNING: changing this file is NOT ALLOWED!
# Consider this to be a gem that Sicklie provides for us, and represents code running on their server(s)

class SicklieApi
  def self.create_patient(first_name:, last_name:)
    case rand(1..4)
    when 1, 2
      { status_code: "SUCCESS", sicklie_id: SecureRandom.uuid }
    when 3
      "Internal server error"
    when 4
      [
        { status_code: "FIELD_ERROR", field: "last_name", message: "Sorry, we don't like this last name right now" },
        { status_code: "PAYMENT_REQUIRED", message: "Your Sicklie API account is past due for payment" },
        { status_code: "SICKLIE_ERROR", message: "Our hosting is too expensive so we throttled this request" }
      ].sample(rand(1..2))
    end
  end

  def self.update_patient(sicklie_id:, first_name:, last_name:)
    case rand(1..4)
    when 1, 2
      { status_code: "SUCCESS" }
    when 3
      "Internal server error"
    when 4
      [
        { status_code: "FIELD_ERROR", field: "last_name", message: "Sorry, we don't like this last name right now" },
        { status_code: "PAYMENT_REQUIRED", message: "Your Sicklie API account is past due for payment" },
        { status_code: "SICKLIE_ERROR", message: "Our hosting is too expensive so we throttled this request" }
      ].sample(rand(1..2))
    end
  end
end