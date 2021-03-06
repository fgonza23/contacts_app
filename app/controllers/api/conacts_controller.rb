class Api::ContactsController < ApplicationController
  def index
    if current_user
    @contacts = current_user.contacts
    render 'index.json.jbuilder'
    else
      render json: []
    end
  end

  def create
    @contact = Contact.new(
                           first_name: params[:first_name],
                           middle_name: params[:middle_name],
                           last_name: params[:last_name],
                           email: params[:email],
                           bio: params[:bio],
                           phone_number: params[:phone_number]
                          )
    @contact.save
    render 'show.json.jbuilder'
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.bio = params[:bio] || @contact.bio
    @contact.phone_number = params[:phone_number] || @contact.phone_number

    @contact.save
    render 'show.json.jbuilder'
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: {message: "Contact successfully destroyed!!"}
  end
end
