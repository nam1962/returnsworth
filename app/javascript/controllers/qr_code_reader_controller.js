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
        window.location.href = result.text;
      })
      .catch((error) => {
        console.error(error);
      });
  }

  disconnect() {
    this.codeReader.reset();
  }
}
