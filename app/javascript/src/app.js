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

const setupTooltips = () => {
  let icons = document.querySelectorAll("[data-tooltip-key]");
  for(let icon of icons) {
    let tooltipId = icon.attributes['data-tooltip-key'].value;
    let tooltipElement = document.querySelector("[data-tooltip-id='"+tooltipId+"']");
    let close = tooltipElement.querySelector(".close");
    console.log(icon);
    icon.addEventListener("click", function(element) {
      //console.log("CLICK", element)
      element.style.display = "block";
    }.bind(this, tooltipElement))
    close.addEventListener("click", function(element) {
      element.style.display = "none";
    }.bind(this, tooltipElement))
  }
}

document.addEventListener("DOMContentLoaded", ()=> {
  const input = document.getElementById("signature_submission_signature_image");
  if (input) {
    input.addEventListener("change", (event) => {
      readURL(event.target, (dataUrl) => {
        showPreview(dataUrl);
      });
    })  
  }
  
  setupTooltips();
  
})

