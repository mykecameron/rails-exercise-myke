class ContactsController < ApplicationController
  def index
    @contacts = Contact.include(:patient).all.order(:first_name, :last_name)
  end
end
