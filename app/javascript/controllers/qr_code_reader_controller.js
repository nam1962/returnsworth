import { Controller } from "@hotwired/stimulus";
import { BrowserQRCodeReader } from "@zxing/library"

export default class extends Controller {
  static targets = ["video"];

  connect() {
    this.codeReader = new BrowserQRCodeReader();
    this.startDecoding();
  }

  startDecoding() {
    this.codeReader
      .decodeFromInputVideoDevice(undefined, this.videoTarget)
      .then((result) => {
        let qrDataFromReader = result.text;
        let formData = new FormData();
        let qrCodeParams = {
          qr_data: qrDataFromReader
        };
        formData.append("qr_code_json_data", JSON.stringify(qrCodeParams));

        Rails.ajax({
          url: "/qr_codes",
          type: "post",
          data: formData
        });
      })
      .catch((error) => {
        console.error(error);
      });
  }

  disconnect() {
    this.codeReader.reset();
  }
}
