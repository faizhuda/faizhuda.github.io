document.addEventListener('DOMContentLoaded', () => {
  // --- MOBILE NAV TOGGLE ---
  const menuToggle = document.querySelector('.menu-toggle');
  const navMenu = document.querySelector('.nav-menu');
  const navbar = document.querySelector('.navbar');
  const navLinks = document.querySelectorAll('.nav-link');

  if (menuToggle && navMenu && navbar) {
    menuToggle.addEventListener('click', () => {
      navMenu.classList.toggle('active');
      navbar.classList.toggle('menu-open');
    });

    // Close menu when clicking link
    navLinks.forEach(link => {
      link.addEventListener('click', () => {
        navMenu.classList.remove('active');
        navbar.classList.remove('menu-open');
      });
    });
  }

  // --- TYPEWRITER EFFECT ---
  const typewriterElement = document.getElementById('typewriter');
  if (typewriterElement) {
    const titles = [
      "Computer Science Student",
      "Aspiring Data Analyst",
      "Data & Tech Enthusiast",
      "Problem Solver"
    ];
    let titleIndex = 0;
    let charIndex = 0;
    let isDeleting = false;
    let delay = 150; // Typing speed

    function type() {
      const currentTitle = titles[titleIndex];
      
      if (isDeleting) {
        // Deleting characters
        typewriterElement.textContent = currentTitle.substring(0, charIndex - 1);
        charIndex--;
        delay = 50; // Faster deletion
      } else {
        // Adding characters
        typewriterElement.textContent = currentTitle.substring(0, charIndex + 1);
        charIndex++;
        delay = 100; // Normal typing speed
      }

      // If finished typing the word
      if (!isDeleting && charIndex === currentTitle.length) {
        delay = 2000; // Hold word for 2s
        isDeleting = true;
      } 
      // If finished deleting the word
      else if (isDeleting && charIndex === 0) {
        isDeleting = false;
        titleIndex = (titleIndex + 1) % titles.length; // Loop back
        delay = 500; // Pause before next word
      }

      setTimeout(type, delay);
    }

    // Start effect
    setTimeout(type, 1000);
  }

  // --- INTERSECTION OBSERVER FOR FADE-IN ANIMATION ---
  const fadeUpElements = document.querySelectorAll('.fade-up-element');
  if ('IntersectionObserver' in window) {
    const observerOptions = {
      root: null, // viewport
      threshold: 0.1, // trigger when 10% visible
      rootMargin: "0px 0px -50px 0px" // trigger slightly before entering viewport
    };

    const observer = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
          // Once animated, stop observing
          observer.unobserve(entry.target);
        }
      });
    }, observerOptions);

    fadeUpElements.forEach(el => observer.observe(el));
  } else {
    // Fallback if browser doesn't support IntersectionObserver
    fadeUpElements.forEach(el => el.classList.add('visible'));
  }

  // --- COPY EMAIL TO CLIPBOARD ---
  const btnCopy = document.querySelector('.btn-copy');
  const emailText = document.querySelector('.email-text');
  const toast = document.getElementById('toast');

  if (btnCopy && emailText && toast) {
    btnCopy.addEventListener('click', () => {
      const email = emailText.textContent.trim();
      
      navigator.clipboard.writeText(email).then(() => {
        // Show Toast Notification
        toast.classList.add('show');
        
        // Hide after 3 seconds
        setTimeout(() => {
          toast.classList.remove('show');
        }, 3000);
      }).catch(err => {
        console.error('Failed to copy text: ', err);
      });
    });
  }

  // --- DYNAMIC YEAR UPDATE ---
  const currentYearSpan = document.getElementById('current-year');
  if (currentYearSpan) {
    currentYearSpan.textContent = new Date().getFullYear();
  }
});
