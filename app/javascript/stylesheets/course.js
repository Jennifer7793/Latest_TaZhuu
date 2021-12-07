// import axios from "axios";
// import ax from "axios"
// import ax from 'lib/client'
// document.addEventListener("turbolinks:load", ()=> {
//     const likeBtn = document.querySelector(".likeBtn");

//     if (likeBtn) {
//     likeBtn.addEventListener("click", () => {
//       const courseID = likeBtn.dataset.id

//       ax.post(`/api/v1/courses/${courseID}/like`).then(({ data }) => {
//         console.log(data)
//         if (data.result === "like") {
//           likeBtn.classList.add("favorited")
//         } else {
//           likeBtn.classList.remove("favorited")
//         }
//       })
//     });
//   };
// });