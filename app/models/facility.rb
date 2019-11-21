class Facility < ApplicationRecord
  require 'csv'

  # before_save { self.capital = capital.to_i}
  validates :name, :prefecture_id, presence: true

  def self.csv_import(file)
    imported_num = 0
    Facility.transaction do
      CSV.foreach(file.path, headers: true) do |row|
        # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
        facility = find_by(id: row["id"]) || new
        # CSVからデータを取得し、設定する
        facility.attributes = row.to_hash.slice(*updatable_attributes)
        # 保存する
        facility.save!
        imported_num += 1
      end
    end
    imported_num
  end

  def self.updatable_attributes
    ["id", "name", "kana", "zipcode", "city", "address_other", "hp_url", "capital", "employees_num", "founded_in", "prefecture_id"]
  end

end
