class UserController < ApplicationController
    before_action :authorize_request, except: :create

    def index
        user = User.all
        render_json_success(user)
    end
    
    def create
        user= User.new(user_params)
        if user.save
            render_json_success(user)
        else
            render_json_validation_error(user)
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render_json_success(user)
        else
            render_json_validation_error(user)
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            render_json_validation_error(user)
        else
            render_json_validation_error(user)
        end
    end

    private

    def user_params
        params.permit(:email, :password, :image)
    end

    rescue ActiveRecord::RecordNotFound
        render json: { error: error.message }, status: :not_found
end
