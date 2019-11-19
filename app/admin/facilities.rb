ActiveAdmin.register Facility do
  config.per_page = 15

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


  # csv_update用のボタン配置
  action_item :import, only: [:index] do
    link_to 'CSVアップデート', csv_update_admin_facilities_path, method: :get
  end

  # csv_updateのルーティングを生成
  collection_action :csv_update, method: :get do
    render '_csv_update'
  end

end
