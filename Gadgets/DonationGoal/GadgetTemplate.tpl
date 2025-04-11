<$control.StyledWrappers(GadgetBegin = "true", GadgetTitleBegin = "true", GadgetTitleText = Model.Appearance.Title, GadgetTitleEnd = "true",  GadgetBodyBegin = "true")$>

	<$if (Model.Settings.Style == "donationGoalStyle001" || Model.Settings.Style == "donationGoalStyle002")$>
		<$if (Model.Description && Model.Description != "")$>
			<div class="donationGoalNotesContainer">
				<$Model.Description$>
			</div>
		<$endif$>

		<div class="donationGoalProgressAndLabels">
			<div class="donationLabel"><span class="donationLabelCaption"><$Model.Text.GoalAmountTitle$></span> <span class="donationAmount donationGoalAmount"><$Model.GoalAmount$></span></div>
			<div class="donationLabel"><span class="donationLabelCaption"><$Model.Text.CollectedTitle$></span> <span class="donationAmount"><$Model.CollectedAmount$></span></div>
		</div>

		<$if (Model.CanAcceptDonations)$>
			<div class="donationGoalButton">
				<input type="button" class="typeButton" value="<$Model.Text.DonateButtonText$>" onclick="window.location.href='<$Model.Urls.Donate$>'" />
			</div>
		<$endif$>

		<div class="progressBar">
			<table cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td class="donationGoalProgressBarLeftPart" width="<$Model.PercentForBar$>%">
						<span></span>
					</td>
					<td class="donationGoalProgressBarRightPart" width="<$Model.PercentForBarLeft$>%"><span></span></td>
				</tr>
			</table>
		</div>

		<div class="collectedPercent">
			<$Model.CollectedPercent$>%
		</div>
	<$endif$>

	<$if (Model.Settings.Style == "donationGoalStyle003" || Model.Settings.Style == "donationGoalStyle004")$>
		<$if (Model.Description && Model.Description != "")$>
			<div class="donationGoalNotesContainer">
				<$Model.Description$>
			</div>
		<$endif$>

		<div class="progressBarAndButton">
			<table class="progressBarAndButtonTable" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td class="progressBarTableContainer">
						<table class="progressBarTable" cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td class="donationGoalProgressBarLeftPart" width="<$Model.PercentForBar$>%"><span></span></td>
								<td class="donationGoalProgressBarRightPart" width="<$Model.PercentForBarLeft$>%"><span></span></td>
							</tr>
						</table>
					</td>
					<td>
						<$if (Model.CanAcceptDonations)$>
							<input type="button" class="typeButton" value="<$Model.Text.DonateButtonText$>" onclick="window.location.href='<$Model.Urls.Donate$>'" />
						<$endif$>
					</td>
				</tr>
			</table>
		</div>

		<div class="donationGoalProgressLabelsPercents">
			<div class="donationLabels">
				<div class="donationLabel"><span class="donationLabelCaption"><$Model.Text.GoalAmountTitle$></span> <span class="donationAmount"><$Model.GoalAmount$></span></div>
				<div class="donationLabel"><span class="donationLabelCaption"><$Model.Text.CollectedTitle$></span> <span class="donationAmount"><$Model.CollectedAmount$></span></div>
			</div>
			<div class="collectedPercents"><$Model.CollectedPercent$>%</div>
			<div class="wideBlock"></div>
		</div>
	<$endif$>

<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>
