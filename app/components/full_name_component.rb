class FullNameComponent < ViewComponent::Base
  def initialize(model)
    @model = model
  end

  def call
    return unless @model.respond_to?(:first_name) && @model.respond_to?(:last_name)
    "#{@model.first_name} #{@model.last_name}"
  end
end