class ContactsController < ApplicationController
  def index
    #TODO consider adding a composite index on first_name and last_name
    @contacts = Contact.all.order(:first_name, :last_name)
  end
end
