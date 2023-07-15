class Return < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :warehouse_operator, foreign_key: :warehouse_operator_id, class_name: "User", optional: true
  belongs_to :client_service_officer, foreign_key: :client_service_officer_id, class_name: "User"
  belongs_to :order
  has_many :items, through: :order
  accepts_nested_attributes_for :order

  after_create :create_qr_code

  def first_order
    order.first
  end

  private

  def create_qr_code
    # qr_code_url = "#{Rails.root}/returns/#{self.id}/edit"
    qr_code_url = edit_return_path(self)

    qrcode = RQRCode::QRCode.new(qr_code_url)
    png = qrcode.as_png(size: 300)
    file_path = save_qr_code_locally(png)
    file_path # Return the file path of the saved QR code
  end

  def save_qr_code_locally(png)
    folder_path = Rails.root.join('app', 'assets', 'images', 'qr_codes')
    FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)

    file_path = folder_path.join("return-#{id}.png")
    File.open(file_path, 'wb') { |f| f.write(png.to_s) }

    file_path # Return the file path of the saved QR code
  end
end
