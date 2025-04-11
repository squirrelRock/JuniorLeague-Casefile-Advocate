<div class="mLayout layoutPlain" id="mLayout">

	<!-- content zone -->
	<div class="zonePlace zoneContent">
		<$Area Name="Content"$>
	</div>
	<!-- /content zone -->

	<$if (!PageModel.IsWidgetMode)$>
		<$if (!PageModel.ShowFreeAccountAds)$>
			<!-- footer zone -->
			<div class="zonePlace zoneWAbranding">
				<div class="WABranding">
					<$MasterLayouts/WAbranding()$>
				</div>
			</div>
			<!-- /footer zone -->
		<$endif$>
	<$endif$>

	<$if (PageModel.ShowFreeAccountAds)$>

		<!-- WA banner zone -->
			<$MasterLayouts/WABanner()$>
		<!-- /WA banner zone -->

	<$endif$>

	<$if (PageModel.GlobalUserJavaScript)$>

		<div id="idCustomJsContainer" class="cnCustomJsContainer">
			<$PageModel.GlobalUserJavaScript$>
		</div>

	<$endif$>

	<$if (PageModel.ShowFreeAccountAds)$>

		<$MasterLayouts/FreeAccountTracker()$>

	<$endif$>

</div>