ActiveAdmin.register Facility do

  # See permitted parameters documentatin
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = :permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params %i[
    id
    name
    kana
    zipcode
    city
    address_other
    hp_url
    capital
    employees_num
    founded_in
    prefecture_id
    tel
    listed_market
  ]
end
