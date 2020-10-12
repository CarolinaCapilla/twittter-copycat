window.onload = function () {
  window.setTimeout(fadeout, 4000); //4 seconds
};

const fadeout = () => {
  const flashes = document.querySelector(".notification");
  flashes.style.visibility = "hidden";
};

export { fadeout };
