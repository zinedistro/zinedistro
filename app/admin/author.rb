ActiveAdmin.register Author do
  remove_filter :authorships

  controller do
    def permitted_params
      params.permit(:utf8, :commit, :authenticity_token, author: [:name])
    end
  end
end
