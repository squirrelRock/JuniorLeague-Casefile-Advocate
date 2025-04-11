<$control.StyledWrappers(GadgetBegin = "true", GadgetTitleBegin = "true", GadgetTitleText = Model.Appearance.Title, GadgetTitleEnd = "true",  GadgetBodyBegin = "true")$>


<ul class="orientation<$Model.Settings.Layout$>  align<$Model.Settings.Align$>" >


		<$if (Model.Settings.FacebookLink!="")$>
			<li>
				<a href="<$Model.Settings.FacebookLink$>" title="Facebook" class="Facebook" target="_blank"></a>
			</li>
		<$endif$>

		<$if (Model.Settings.TwitterLink!="")$>
			<li>
				<a href="<$Model.Settings.TwitterLink$>" title="Twitter" class="Twitter" target="_blank"></a>
			</li>
		<$endif$>

		<$if (Model.Settings.LinkedInLink!="")$>
			<li>
				<a href="<$Model.Settings.LinkedInLink$>" title="LinkedIn" class="LinkedIn" target="_blank"></a>
			</li>
		<$endif$>

		<$if (Model.Settings.YouTubeLink!="")$>
			<li>
				<a href="<$Model.Settings.YouTubeLink$>" title="YouTube" class="YouTube" target="_blank"></a>
			</li>
		<$endif$>

		<$if (Model.Settings.InstagramLink!="")$>
			<li>
				<a href="<$Model.Settings.InstagramLink$>" title="Instagram" class="Instagram" target="_blank"></a>
			</li>
		<$endif$>
		
		<$if (Model.Settings.PinterestLink!="")$>
			<li>
				<a href="<$Model.Settings.PinterestLink$>" title="Pinterest" class="Pinterest" target="_blank"></a>
			</li>
		<$endif$>


</ul>

<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>





