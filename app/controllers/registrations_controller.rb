class RegistrationsController < Devise::RegistrationsController


  def create
    require 'HTTParty'
    postcode = params[:user][:postcode]
    @response = HTTParty.get("https://digitalapi.auspost.com.au/postcode/search.json", :query => {"q" => "#{postcode}"}, :headers => {"AUTH-KEY" => "fcfb87e5-6710-47d4-b275-2f350392911b"})

          @data = @response.parsed_response["localities"]["locality"]
                if @data.is_a?(Array)
                      create_user_without_postcode
                    elsif @data.is_a?(Hash)
                      create_user
                    end

  end

  def update_resource(resource, account_update_params)
    resource.update_without_password(account_update_params)
  end

  private

  def create_user
    build_resource(sign_up_params)
        resource.save
        resource.location = @data["location"]
        resource.state = @data["state"]
        yield resource if block_given?
        if resource.persisted?
          if resource.active_for_authentication?
            set_flash_message! :notice, :signed_up
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
  end

  def create_user_without_postcode
    build_resource(sign_up_params)
        resource.save
        yield resource if block_given?
        if resource.persisted?
          if resource.active_for_authentication?
            sign_up(resource_name, resource)
            render "devise/registrations/_ask"
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
  end


  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :mobilenumber, :postcode, :email, :password, :password_confirmation, :location)
  end

  def account_update_params
    params.require(:user).permit(:avatar, :firstname, :lastname, :mobilenumber, :postcode, :remove_avatar, :email, :current_password, :location)
  end
end
