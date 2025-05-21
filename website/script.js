// Theme toggle
document.getElementById("toggle-theme").addEventListener("change", function () {
  document.body.classList.toggle("dark-mode");
});

// Fade-in animation on scroll
const faders = document.querySelectorAll(".fade-in");

const appearOptions = {
  threshold: 0.1,
  rootMargin: "0px 0px -100px 0px"
};

const appearOnScroll = new IntersectionObserver(function (entries, observer) {
  entries.forEach(entry => {
    if (!entry.isIntersecting) return;
    entry.target.classList.add("appear");
    observer.unobserve(entry.target);
  });
}, appearOptions);

faders.forEach(fader => {
  appearOnScroll.observe(fader);
});
