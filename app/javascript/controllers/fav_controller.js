
import { Controller } from "stimulus"
import ax from "lib/client"

export default class extends Controller {
  static targets = ["btn"]
  static values = {
    liked: Boolean,
    courseId: Number
  }

  connect(){
    if (this.likedValue) {
      this.btnTarget.classList.add("favorited")
    }
    // if (this.btnTarget.dataset.liked === "true") {
    //   this.btnTarget.classList.add("favorited")
    // }
  }

  like() {
    const courseID = this.courseIdValue
    const likeBtn = this.btnTarget

    ax.post(`/api/v1/courses/${courseID}/like`).then(({ data }) => {
      if (data.result === "like") {
        likeBtn.classList.add("favorited")
      } else {
        likeBtn.classList.remove("favorited")
      }
    });
  }
}