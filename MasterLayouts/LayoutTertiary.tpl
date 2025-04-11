<div class="mLayout layoutMain" id="mLayout">

	<$if (!PageModel.IsWidgetMode)$>

		<!-- header zone -->
		<div class="zonePlace zoneHeader1">
			<$Area Name="Header"$>
		</div>
		<div class="zonePlace zoneHeader2">
			<$Area Name="Header1"$>
		</div>
		<div class="zonePlace zoneHeader3">
			<$Area Name="Header2"$>
		</div>
		<!-- /header zone -->

	<$endif$>

	<!-- content zone -->
	<div class="zonePlace zoneContent">
		<$Area Name="Content"$>
	</div>
	<div class="zonePlace zoneContent">
		<$Area Name="Content1"$>
	</div>
	<div class="zonePlace zoneContent">
		<$Area Name="Content2"$>
	</div>
	<div class="zonePlace zoneContent">
		<$Area Name="Content3"$>
	</div>
	<div class="zonePlace zoneContent">
		<$Area Name="Content4"$>
	</div>
	<!-- /content zone -->

	<$if (!PageModel.IsWidgetMode)$>

		<!-- footer zone -->
		<div class="zonePlace zoneFooter1">
			<$Area Name="Footer"$>
		</div>
		<div class="zonePlace zoneFooter2">
			<$Area Name="Footer1"$>
		</div>
		<div class="zonePlace zoneFooter3">
			<$Area Name="Footer2"$>
		</div>

		<$if (!PageModel.ShowFreeAccountAds)$>
			<div class="zonePlace zoneWAbranding">
				<div class="WABranding">
					<$MasterLayouts/WAbranding()$>
				</div>
			</div>
		<$endif$>
	<!-- /footer zone -->

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