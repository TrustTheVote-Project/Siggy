const readURL = (input, callback) => {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function(e) {
      callback(e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

const showPreview = (url) => {
  const e = document.getElementById("signature_image_preview");
  console.log(e);
  e.style.setProperty("display", "block");
  e.setAttribute("src", url);
}

document.addEventListener("DOMContentLoaded", ()=> {
  console.log('hi');
  const input = document.getElementById("signature_submission_signature_image");
  console.log(input);
  input.addEventListener("change", (event) => {
    readURL(event.target, (dataUrl) => {
      showPreview(dataUrl);
    });
  })

})
