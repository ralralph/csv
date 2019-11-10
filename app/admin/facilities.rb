ActiveAdmin.register Facility do
  config.per_page = 15

  action_item only: [:index] do
    link_to 'CSVアップデート', root_path, method: :get
  end

  form do |f|
    inputs  do
      input :name
      input :prefecture
      input :address
    end

    actions
  end

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
