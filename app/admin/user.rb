ActiveAdmin.register User do
  controller do
    def permitted_params
      params.permit(:utf8,
                    :commit,
                    :authenticity_token,
                    user: [:email,
                           :password,
                           :password_confirmation])
    end
  end

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
  end

  filter :email

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
