class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all.order(id: :asc)
  end

  def import
    if params[:file].blank?
      redirect_to csv_update_admin_facilities_path, alert: 'ファイルを添付してください。'
    elsif File.extname(params[:file].original_filename) != ".csv"
      redirect_to csv_update_admin_facilities_path, alert: 'csvファイルのみ読み込み可能です。'
    else
      begin
        imported_num = Facility.import(params[:file])
        redirect_to admin_facilities_path, notice: "#{imported_num}件のデータを追加/更新しました。"
      rescue => error
        redirect_to csv_update_admin_facilities_path, alert: error.message
      end
    end
  end

end
