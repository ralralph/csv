require 'csv'

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
    link_to 'CSVアップデート', csv_update_admin_facilities_path
  end

  # csv_updateのルーティングを生成
  collection_action :csv_update, method: :get do
    render '_csv_update'
  end

  # csv_update#postのルーティング
  collection_action :csv_import, method: :post do
  end

  controller do
    def csv_import
      if params[:file].blank?
        redirect_to csv_update_admin_facilities_path, alert: 'ファイルを添付してください。'
      elsif File.extname(params[:file].original_filename) != ".csv"
        redirect_to csv_update_admin_facilities_path, alert: 'csvファイルのみ読み込み可能です。'
      else
        begin
          file = params[:file]
          # 保存・更新数のカウント
          imported_num = 0
          Facility.transaction do
            CSV.foreach(file.path, headers: true) do |row|
              # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
              facility = Facility.find_by(id: row["id"]) || Facility.new
              # CSVからデータを取得し、設定する
              facility.attributes = row.to_hash.slice(*updatable_attributes)
              facility.save!
              imported_num += 1
            end
          end
          redirect_to admin_facilities_path, notice: "#{imported_num}件のデータを追加/更新しました。"
        rescue => error
          redirect_to csv_update_admin_facilities_path, alert: error.message
        end
      end
    end

    def updatable_attributes
      ["id", "name", "kana", "zipcode", "city", "address_other", "hp_url", "capital", "employees_num", "founded_in", "prefecture_id"]
    end

  end

end
