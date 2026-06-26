document.addEventListener('DOMContentLoaded', () => {
  // --- MOBILE NAV TOGGLE ---
  const menuToggle = document.querySelector('.menu-toggle');
  const navMenu = document.querySelector('.nav-menu');
  const navbar = document.querySelector('.navbar');
  const navLinks = document.querySelectorAll('.nav-link');

  if (menuToggle && navMenu && navbar) {
    menuToggle.addEventListener('click', () => {
      const isActive = navMenu.classList.toggle('active');
      navbar.classList.toggle('menu-open');
      
      if (isActive) {
        document.body.classList.add('scroll-lock');
      } else {
        document.body.classList.remove('scroll-lock');
      }
    });

    // Close menu when clicking link
    navLinks.forEach(link => {
      link.addEventListener('click', () => {
        navMenu.classList.remove('active');
        navbar.classList.remove('menu-open');
        document.body.classList.remove('scroll-lock');
      });
    });
  }

  // --- TYPEWRITER EFFECT ---
  const typewriterElement = document.getElementById('typewriter');
  if (typewriterElement) {
    const titles = [
      "ML Engineer",
      "Full-Stack Developer",
      "Computer Science Student",
      "DevOps Enthusiast"
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
      
      function showToast() {
        toast.classList.add('show');
        setTimeout(() => {
          toast.classList.remove('show');
        }, 3000);
      }
      
      if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(email).then(() => {
          showToast();
        }).catch(err => {
          console.error('Failed to copy text (clipboard API): ', err);
          fallbackCopy(email);
        });
      } else {
        fallbackCopy(email);
      }
      
      function fallbackCopy(text) {
        try {
          const textArea = document.createElement("textarea");
          textArea.value = text;
          textArea.style.top = "0";
          textArea.style.left = "0";
          textArea.style.position = "fixed";
          document.body.appendChild(textArea);
          textArea.focus();
          textArea.select();
          const successful = document.execCommand('copy');
          document.body.removeChild(textArea);
          if (successful) {
            showToast();
          } else {
            console.error('Fallback copy command was unsuccessful');
          }
        } catch (err) {
          console.error('Fallback copy failed: ', err);
        }
      }
    });
  }

  // --- TOUCH HOLD SIMULATOR FOR MOBILE ---
  const touchInteractiveElements = document.querySelectorAll(
    '.hero-image-wrapper, .glass-card, .btn, .social-icon-link, .btn-copy, .skill-badge, .email-copy-box'
  );
  touchInteractiveElements.forEach(el => {
    el.addEventListener('touchstart', () => {
      el.classList.add('hovered');
    }, { passive: true });
    
    el.addEventListener('touchend', () => {
      el.classList.remove('hovered');
    }, { passive: true });
    
    el.addEventListener('touchcancel', () => {
      el.classList.remove('hovered');
    }, { passive: true });
  });

  // --- CUSTOM CURSOR ---
  const cursorDot = document.querySelector('.custom-cursor-dot');
  const cursorOutline = document.querySelector('.custom-cursor-outline');
  
  if (cursorDot && cursorOutline) {
    let mouseX = 0;
    let mouseY = 0;
    let outlineX = 0;
    let outlineY = 0;
    
    // Check if device supports hover (is it a desktop/laptop with a mouse?)
    const hasHover = window.matchMedia('(hover: hover) and (pointer: fine)').matches;
    
    if (hasHover) {
      window.addEventListener('mousemove', e => {
        mouseX = e.clientX;
        mouseY = e.clientY;
        
        // Instant position for the inner dot
        cursorDot.style.left = `${mouseX}px`;
        cursorDot.style.top = `${mouseY}px`;
      }, { passive: true });
      
      // Animation loop for smooth lag effect on outer outline
      const animateCursor = () => {
        outlineX += (mouseX - outlineX) * 0.15;
        outlineY += (mouseY - outlineY) * 0.15;
        
        cursorOutline.style.left = `${outlineX}px`;
        cursorOutline.style.top = `${outlineY}px`;
        
        requestAnimationFrame(animateCursor);
      };
      requestAnimationFrame(animateCursor);
      
      // Bind hover state on links/buttons
      const interactiveElements = document.querySelectorAll(
        'a, button, .btn, .logo, .social-icon-link, .email-copy-box, .skill-badge, .filter-btn'
      );
      interactiveElements.forEach(el => {
        el.addEventListener('mouseenter', () => {
          document.body.classList.add('cursor-hovered');
        });
        el.addEventListener('mouseleave', () => {
          document.body.classList.remove('cursor-hovered');
        });
      });
    }
  }

  // --- SCROLL PROGRESS BAR ---
  const scrollBar = document.getElementById('scroll-bar');
  if (scrollBar) {
    window.addEventListener('scroll', () => {
      const scrollTop = window.scrollY || document.documentElement.scrollTop;
      const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
      const scrollPercentage = scrollHeight > 0 ? (scrollTop / scrollHeight) * 100 : 0;
      scrollBar.style.width = `${scrollPercentage}%`;
    }, { passive: true });
  }

  // --- PROJECT FILTERS ---
  const filterButtons = document.querySelectorAll('.filter-btn');
  const projectCards = document.querySelectorAll('.project-card');
  
  if (filterButtons.length > 0 && projectCards.length > 0) {
    filterButtons.forEach(btn => {
      btn.addEventListener('click', () => {
        // Toggle active button
        filterButtons.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        
        const filterValue = btn.getAttribute('data-filter');
        
        projectCards.forEach(card => {
          const cardCategory = card.getAttribute('data-category');
          
          if (filterValue === 'all' || cardCategory === filterValue) {
            // First show the element if it was display none
            card.classList.remove('hidden');
            // Trigger reflow to let the transition animate
            void card.offsetWidth;
            card.classList.remove('fade-out');
          } else {
            // Fade out first
            card.classList.add('fade-out');
            // Hide display once animation finishes
            card.addEventListener('transitionend', function hideCard(e) {
              if (e.propertyName === 'opacity' && card.classList.contains('fade-out')) {
                card.classList.add('hidden');
                card.removeEventListener('transitionend', hideCard);
              }
            });
          }
        });
      });
    });
  }

  // --- CV PREVIEW MODAL ---
  const btnCv = document.getElementById('btn-cv');
  const cvModal = document.getElementById('cv-modal');
  const cvModalClose = document.getElementById('cv-modal-close');
  const cvModalBackdrop = document.getElementById('cv-modal-backdrop');
  
  if (btnCv && cvModal && cvModalClose && cvModalBackdrop) {
    const openModal = () => {
      cvModal.classList.add('active');
      document.body.classList.add('scroll-lock');
    };
    
    const closeModal = () => {
      cvModal.classList.remove('active');
      document.body.classList.remove('scroll-lock');
    };
    
    btnCv.addEventListener('click', openModal);
    cvModalClose.addEventListener('click', closeModal);
    cvModalBackdrop.addEventListener('click', closeModal);
    
    // Close on Escape key press
    window.addEventListener('keydown', e => {
      if (e.key === 'Escape' && cvModal.classList.contains('active')) {
        closeModal();
      }
    });
  }

  // --- CONTACT FORM SUBMISSION ---
  const contactForm = document.getElementById('contact-form');
  const btnSubmit = document.getElementById('btn-submit');
  
  if (contactForm && btnSubmit) {
    const submitText = btnSubmit.querySelector('span');
    const originalText = submitText ? submitText.textContent : 'Send Message';
    
    contactForm.addEventListener('submit', e => {
      e.preventDefault();
      
      // Update sending visual state
      if (submitText) submitText.textContent = 'Sending...';
      btnSubmit.disabled = true;
      
      const formData = new FormData(contactForm);
      const jsonObject = {};
      formData.forEach((value, key) => {
        jsonObject[key] = value;
      });
      
      // If Web3Forms placeholder key is present, alert user or run fallback
      if (jsonObject['access_key'] === 'YOUR_ACCESS_KEY_HERE') {
        setTimeout(() => {
          alert('Message sent successfully! (Note: Replace placeholder Web3Forms API Key with your own in index.html to get real emails).');
          if (submitText) submitText.textContent = originalText;
          btnSubmit.disabled = false;
          contactForm.reset();
          
          // Trigger copy email toast as a simulated success alert
          const toast = document.getElementById('toast');
          if (toast) {
            toast.textContent = 'Message sent! (Simulated Mode)';
            toast.classList.add('show');
            setTimeout(() => {
              toast.classList.remove('show');
              toast.textContent = 'Email copied to clipboard!';
            }, 3000);
          }
        }, 1000);
        return;
      }
      
      // Async post submit to Web3Forms
      fetch('https://api.web3forms.com/submit', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: JSON.stringify(jsonObject)
      })
      .then(async response => {
        let json = await response.json();
        if (response.status === 200) {
          // Success
          contactForm.reset();
          const toast = document.getElementById('toast');
          if (toast) {
            toast.textContent = 'Message sent successfully!';
            toast.classList.add('show');
            setTimeout(() => {
              toast.classList.remove('show');
              toast.textContent = 'Email copied to clipboard!';
            }, 3000);
          }
        } else {
          // Error response
          console.error(json);
          alert('Submission failed: ' + (json.message || 'Unknown error'));
        }
      })
      .catch(error => {
        console.error(error);
        alert('An error occurred during submission.');
      })
      .finally(() => {
        if (submitText) submitText.textContent = originalText;
        btnSubmit.disabled = false;
      });
    });
  }

  // --- DYNAMIC YEAR UPDATE ---
  const currentYearSpan = document.getElementById('current-year');
  if (currentYearSpan) {
    currentYearSpan.textContent = new Date().getFullYear();
  }
});
