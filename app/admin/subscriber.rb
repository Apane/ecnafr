ActiveAdmin.register Subscriber do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :category_id, :created_at, :updated_at, :categories => []

 controller do

    def permitted_params
      params.permit(:subscrober => [:email, :category_id, :created_at, :updated_at,])
    end
  end

    #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end

