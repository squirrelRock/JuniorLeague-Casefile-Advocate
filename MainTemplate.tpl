<!DOCTYPE html>
<html lang="en" class="no-js <$PageModel.HtmlCssClass$>">
  <head id="<$PageModel.HeadId$>">
    <$Head()$>
  </head>
  <body id="<$PageModel.BodyId$>" class="<$PageModel.BodyCssClass$>">
    <$MASTER_LAYOUT$>

    <!-- bootstrap js -->
    <script src="/resources/Theme_Overrides/casefile_advocate.v3.0/bootstrap.bundle.min.js"></script>

	<script>
	document.querySelectorAll('.dropdown-submenu .dropdown-toggle').forEach(function(toggle) {
  toggle.addEventListener('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    let submenu = this.nextElementSibling;
    if (submenu) {
      submenu.classList.toggle('show');
    }
  });
});
</script>

  </body>
</html>