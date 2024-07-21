document.addEventListener('turbo:load', () => {
  setTimeout(() => {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
      alert.classList.remove('show');
      alert.classList.add('fade');
      alert.addEventListener('transitionend', () => {
        alert.remove();
      });
    });
  }, 3000); // 3000 milliseconds = 3 seconds

  // Ensure the 'x' button dismisses the alert
  document.querySelectorAll('.btn-close').forEach(button => {
    button.addEventListener('click', () => {
      const alert = button.closest('.alert');
      alert.classList.remove('show');
      alert.classList.add('fade');
      alert.addEventListener('transitionend', () => {
        alert.remove();
      });
    });
  });
});
