<$if(!Model.IsHiddenOnPage)$>
<$if(Model.Security.IsAuthenticated && !Model.IsSitePreviewMode)$>
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
<$if (Model.Settings.Style == "LoginFormStyle001")$>
<div class="loginContainer align<$Model.Settings.Align$>">
  <div class="loginContainerInner">
    <a id="<$Model.Id$>_loginLink" class="loginLink"><$Model.Text.LinkSignInText$></a>
    <div id="<$Model.Id$>_loginContainer" class="loginPanel">
      <div class="loginContainerForm oAuthIs<$Model.Settings.ShowOpenAuthButtons$>">
        <div class="loginContainerFormInner">
          <$if(Model.Settings.ShowOpenAuthButtons)$>
          <$control.OAuthForm(id=Model.Id + "_oAuthForm")$>
          <$endif$>
          <$control.Form(formBegin = "true", action = Model.Urls.Authenticate, id = Model.Id + "_form", class="generalLoginBox")$>
            <input type="hidden" name="ReturnUrl" id="<$Model.Id$>_returnUrl" value="<$Model.Urls.Return$>">
            <input type="hidden" name="CurrentUrl" id="<$Model.Id$>_currentUrl" value="<$Model.Urls.Current$>">
            <input type="hidden" name="browserData" id="<$Model.Id$>_browserField">
            <$if (Model.StayOnTheSamePage)$>
            <input type="hidden" name="stayOnTheSamePage" value="true">
            <$endif$>
            <$UserName()$>
            <$Password()$>
			<$control.GoogleReCaptcha(Model=Model.Captcha)$>
            <$RememberMe()$>
            <$Button()$>
            <$ForgotPassword()$>
          <$control.Form(formEnd = "true")$>
        </div>
      </div>
    </div>
  </div>
</div>
<$endif$>
<$if (Model.Settings.Style == "LoginFormStyle002")$>
<div class="loginContainer align<$Model.Settings.Align$>">
  <div class="loginContainerInner">
    <a id="<$Model.Id$>_loginLink" class="loginLink"><$Model.Text.LinkSignInText$></a>
    <div id="<$Model.Id$>_loginContainer" class="loginPanel">
      <div class="loginContainerForm oAuthIs<$Model.Settings.ShowOpenAuthButtons$>">
        <div class="loginContainerFormInner">
          <$if(Model.Settings.ShowOpenAuthButtons)$>
          <$control.OAuthForm(id=Model.Id + "_oAuthForm")$>
          <$endif$>
          <$control.Form(formBegin = "true", action = Model.Urls.Authenticate, id = Model.Id + "_form", class="generalLoginBox")$>
            <input type="hidden" name="ReturnUrl" id="<$Model.Id$>_returnUrl" value="<$Model.Urls.Return$>">
            <input type="hidden" name="CurrentUrl" id="<$Model.Id$>_currentUrl" value="<$Model.Urls.Current$>">
            <input type="hidden" name="browserData" id="<$Model.Id$>_browserField">
            <$if (Model.StayOnTheSamePage)$>
            <input type="hidden" name="stayOnTheSamePage" value="true">
            <$endif$>
            <$UserName()$>
            <$Password()$>
			<$control.GoogleReCaptcha(Model=Model.Captcha)$>
            <$Button()$>
            <$RememberMe()$>
            <$ForgotPassword()$>
          <$control.Form(formEnd = "true")$>
        </div>
      </div>
    </div>
  </div>
</div>
<$endif$>
<$endif$>
<script>
  jq$(function() {
    var gadgetId = jq$('#<$Model.Id$>'),
        containerBox = gadgetId.find('.loginPanel'),
        loginLink = gadgetId.find('.loginLink'),
        transitionTime = 300;

    containerBox.isOpening = false;

    loginLink.on('click', function(e) {
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

    jq$('body').on('click',function() {
      if (containerBox.css("visibility") == 'visible' && !containerBox.isOpening) {
        loginLink.removeClass('hover');
        containerBox.animate({ 'opacity': '0' }, transitionTime, function() {
          containerBox.css('visibility','hidden');
          containerBox.css('display','none');
        });
      }
    });

    var browserField = document.getElementById('<$Model.Id$>' + '_browserField');

    if (browserField) {
      browserField.value = browserInfo.getBrowserCapabilitiesData();
    }

    jq$('#<$Model.Id$>' + '_form').FormValidate();
    jq$('.WaGadgetLoginForm form').attr('data-disableInAdminMode', 'false');
  });
</script>
<$endif$>