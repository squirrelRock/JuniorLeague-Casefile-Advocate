<$if(!Model.IsHiddenOnPage)$>
<div class="align<$Model.Settings.Align$> <$if(Model.Security.IsAuthenticated)$>authorized<$else$>unauthorized<$endif$>">
  <$if(Model.Security.IsAuthenticated)$>
  <div class="loginContainer authenticated align<$Model.Settings.Align$>">
    <div class="loginContainerInner">
      <a id="<$Model.Id$>_loginLink" class="loginLink"><$if(Model.IsLapsedMembership)$><$Model.Text.LabelLapsed$> <$endif$><$Model.UserFullName$></a>
      <div id="<$Model.Id$>_loginContainer" class="loginPanel">
        <div class="loggedName"><$if(Model.IsLapsedMembership)$><$Model.Text.LabelLapsed$> <$endif$><$Model.UserFullName$></div>
        <$if (!Model.IsSystemAdminView)$>
        <div class="profileBox viewProfileBox">
          <a href=<$if (Model.IsAdminView)$>"<$Model.Urls.ContactDetails$>" target="_blank"<$else$>"<$Model.Urls.Profile$>"<$endif$>><$Model.Text.LinkProfileText$></a>
        </div>
        <$endif$>
        <div class="profileBox changePasswordBox">
          <a href="<$Model.Urls.ChangePassword$>"<$if (Model.IsAdminView)$> target="_blank"<$endif$>><$Model.Text.LinkChangePasswordText$></a>
        </div>
        <div class="profileBox loggedAction">
          <$control.Form(formBegin = "true", action = Model.Urls.SignOut)$>
            <input type="submit" size="20" value="<$Model.Text.LinkSignOutText$>" id="ctl00_LeftMenuArea_Authentication1_loginViewControl_LogoutButton" class="loginBoxLogout">
          <$control.Form(formEnd = "true")$>
        </div>
      </div>
    </div>
  </div>
  <$else$>
  <div class="loginContainer">
    <a class="loginLink" href="<$Model.Urls.Authenticate$>" title="<$Model.Text.LinkSignInText$>"><$Model.Text.LinkSignInText$></a>
  </div>
  <$endif$>
</div>
<script>
  jq$(function() {
    var gadgetId = jq$('#<$Model.Id$>'),
        containerBox = gadgetId.find('.loginPanel'),
        loginLink = gadgetId.find('.loginLink'),
        transitionTime = 300;

    containerBox.isOpening = false;

    loginLink.on('click', function() {
      if (containerBox.css("visibility") == 'visible') {
        loginLink.removeClass('hover');
        containerBox.animate({ 'opacity': '0' }, transitionTime, function() {
          containerBox.css('visibility','hidden');
          containerBox.css('display','none');
        });
      } else {
        loginLink.addClass('hover');
        containerBox.isOpening = true;
        containerBox.css('display','block');
        containerBox.css('visibility','visible');
        containerBox.animate({ 'opacity': '1' }, transitionTime, function() {
          containerBox.isOpening = false;
        });
      }
    });

    containerBox.on('click', function(e) { e.stopPropagation(); });

    jq$('body').on('click', function() {
      if (containerBox.css("visibility") == 'visible' && !containerBox.isOpening) {
        loginLink.removeClass('hover');
        containerBox.animate({ 'opacity': '0' }, transitionTime, function() {
          containerBox.css('visibility','hidden');
          containerBox.css('display','none');
        });
      }
    });
  });
</script>
<$endif$>