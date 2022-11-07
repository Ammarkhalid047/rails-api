module RenderHelper
    def render_json_validation_error(resource)
        render json: {status: 402, message: 'Something went wrong', error: resource.errors}
    end

    def render_json_success(resource)
        render json: {status: 200, message: 'Api Hit Successfull', user: resource}
    end
end