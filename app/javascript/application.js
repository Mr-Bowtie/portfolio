// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// mobile burger menu toggle
document.addEventListener('turbo:load', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
  const $navbarItems = Array.prototype.slice.call(document.querySelectorAll(".navbar-item"), 0)  

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
        // add click event for each option in menu
        $navbarItems.forEach( ni => {
            ni.addEventListener("click", () => {

                const target = el.dataset.target;
                const $target = document.getElementById(target);
                
                // close menu after clicking on menu option
                el.classList.toggle('is-active');
                $target.classList.toggle('is-active');

            })
        })
    });

  }

});
