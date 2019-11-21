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
  action_item :csv_update, only: [:index] do
    link_to 'CSVアップデート', csv_update_admin_facilities_path, method: :get
  end

  # csv_updateのルーティングを生成
  collection_action :csv_update, method: :get do
    render '_csv_update'
  end

  collection_action :csv_import, method: :post do
    if params[:file].blank?
      redirect_to csv_update_admin_facilities_path, alert: 'ファイルを添付してください。'
    elsif File.extname(params[:file].original_filename) != ".csv"
      redirect_to csv_update_admin_facilities_path, alert: 'csvファイルのみ読み込み可能です。'
    else
      begin
        imported_num = Facility.csv_import(params[:file])
        redirect_to admin_facilities_path, notice: "#{imported_num}件のデータを追加/更新しました。"
      rescue => error
        redirect_to csv_update_admin_facilities_path, alert: error.message
      end
    end
  end

end
