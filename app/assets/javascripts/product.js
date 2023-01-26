document.querySelectorAll('select').forEach((select) => {
  select.addEventListener('change', () => {
    if (select.value === 'new-store') {
      select.nextElementSibling.disabled = false;
      select.nextElementSibling.hidden = false;
    } else {
      select.nextElementSibling.disabled = true;
      select.nextElementSibling.hidden = true;
    }
  });
});