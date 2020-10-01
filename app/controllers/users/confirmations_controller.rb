# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  def create
    current_user.update(email: current_user.unconfirmed_email)
  end
  
  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    @newemail = current_user.unconfirmed_email
    current_user.update(email: @newemail)
    
    binding.pry
    
  end

  protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    root_path
  end
end
