<$control.Form(formBegin = "true", action = Model.Urls.AcceptUrl)$>
    <input type="hidden" name="ReturnUrl" value="<$Model.Urls.ReturnUrl$>">
    <div id="idTermsOfUseContainer">
        <div class="fieldItem">
            <span class="typeCheckboxContainer">
                <input id="ctl00_ContentArea_termsOfUse_termsOfUseAcceptedCheckBox" name="termsOfUseAcceptedCheckBox" onclick="TermsOfUsePage.termsOfUseSelected();" class="typeCheckbox" type="checkbox">
            </span>
            <span class="label">
                <label for="ctl00_ContentArea_termsOfUse_termsOfUseAcceptedCheckBox" id="ctl00_ContentArea_termsOfUse_lblTermsOfUse">
                    <span class="textLine"><$Model.Text.Agreement$></span>
                    <span class="textLine">
                        <div style="visibility: visible;" id="ctl00_ContentArea_termsOfUse_termsOfUseValidatorDiv">
                            <span id="ctl00_ContentArea_termsOfUse_acceptedValidator" class="mandatorySymbol"><$Model.Text.AgreementValidator$></span>
                        </div>
                    </span>
                </label>
            </span>
        </div>
        <div class="clearEndContainer"></div>
    </div>
    <div class="login-role-actions">
        <input name="submitButton" value="<$Model.Text.SubmitButton$>" id="ctl00_ContentArea_submitButton" title="<$Model.Text.SubmitButtonTitle$>" type="submit" />
        <input name="cancelButton" value="<$Model.Text.CancelButton$>" id="ctl00_ContentArea_cancelButton" title="<$Model.Text.CancelButtonTitle$>" type="submit" />
    </div>
<$control.Form(formEnd = "true")$>

<script language="javascript" type="text/javascript">

(function()
{
  if (window.TermsOfUsePage == null) 
  {
    window.TermsOfUsePage = new Object();
  }
  
  TermsOfUsePage.initTermsOfUseControls = initTermsOfUseControls;
  TermsOfUsePage.termsOfUseSelected = termsOfUseSelected;    
  
  var termsOfUseCheckBox = null;
  var termsOfUseValidatorDiv = null;
  var submitButton = null;
  
  
  function initTermsOfUseControls (termsOfUseCheckBoxId, validatorDivId, submitButtonId)
  {
    termsOfUseCheckBox = WA.$(termsOfUseCheckBoxId, window);
    termsOfUseValidatorDiv = WA.$(validatorDivId, window); 
	submitButton = WA.$(submitButtonId, window);
    termsOfUseSelected();
  }
    
  function isValid ()
  {
    return termsOfUseCheckBox && termsOfUseValidatorDiv && submitButton;
  }
  
  
  function termsOfUseSelected ()
  {
    if (!isValid())
    {
      return;
    }
    if (termsOfUseCheckBox.checked)
    {
      termsOfUseAccepted();
    }
    else
    {
      termsOfUseDeclined();
    }
  }
  
  
  function termsOfUseAccepted ()
  {
    submitButton.disabled = false;
    termsOfUseValidatorDiv.style.visibility = 'hidden';
  }
  
  
  function termsOfUseDeclined ()
  {
    submitButton.disabled = true;
    termsOfUseValidatorDiv.style.visibility = 'visible';
  }

}) ();

jq$(document).ready(function () 
{
 TermsOfUsePage.initTermsOfUseControls('ctl00_ContentArea_termsOfUse_termsOfUseAcceptedCheckBox', 'ctl00_ContentArea_termsOfUse_termsOfUseValidatorDiv', 'ctl00_ContentArea_submitButton'); 
});

</script>