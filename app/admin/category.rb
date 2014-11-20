ActiveAdmin.register Category do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :name, :category_type, :created_at, :updated_at

  controller do

    def permitted_params
      params.permit(:category => [:email, :category_id, :created_at, :updated_at,])
    end
  end


  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
