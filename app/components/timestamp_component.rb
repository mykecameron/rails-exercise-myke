class TimestampComponent < ViewComponent::Base
  def initialize(timestamp, alternate=nil)
    @timestamp = timestamp
    @alternate = alternate
  end

end
