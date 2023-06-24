class Return < ApplicationRecord
  belongs_to :warehouse_operator, foreign_key: :warehouse_operator_id, class_name: "User", optional: true
  belongs_to :client_service_officer, foreign_key: :client_service_officer_id, class_name: "User"

  has_many :return_items
  accepts_nested_attributes_for :return_items

  after_create_commit :create_qr_code

  private


  def create_qr_code
    qrcode = RQRCode::QRCode.new("Return-#{id}")
    png = qrcode.as_png(size: 300)
    save_qr_code_locally(png)
  end

  def save_qr_code_locally(png)
    folder_path = Rails.root.join('public', 'qr_codes')
    FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)

    file_path = folder_path.join("return-#{id}.png")
    File.open(file_path, 'wb') { |f| f.write(png.to_s) }
  end
end
