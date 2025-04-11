<$control.StyledWrappers(GadgetBegin = "true", GadgetTitleBegin = "true", GadgetTitleText = Model.Appearance.Title, GadgetTitleEnd = "true",  GadgetBodyBegin = "true")$>

<ul class="orientation<$Model.Settings.Layout$> align<$Model.Settings.Align$>">

	<$if (Model.Settings.Name1!="" && Model.Settings.Url1!="")$>
		<li>
			<a href="<$Model.Settings.Url1$>" title="<$Model.Settings.Name1$>"><$Model.Settings.Name1$></a>
		</li>
	<$endif$>

	<$if (Model.Settings.Name2!="" && Model.Settings.Url2!="")$>
		<li>
			<a href="<$Model.Settings.Url2$>" title="<$Model.Settings.Name2$>"><$Model.Settings.Name2$></a>
		</li>
	<$endif$>


	<$if (Model.Settings.Name3!="" && Model.Settings.Url3!="")$>
		<li>
			<a href="<$Model.Settings.Url3$>" title="<$Model.Settings.Name3$>"><$Model.Settings.Name3$></a>
		</li>
	<$endif$>


	<$if (Model.Settings.Name4!="" && Model.Settings.Url4!="")$>
		<li>
			<a href="<$Model.Settings.Url4$>" title="<$Model.Settings.Name4$>"><$Model.Settings.Name4$></a>
		</li>
	<$endif$>


	<$if (Model.Settings.Name5!="" && Model.Settings.Url5!="")$>
		<li>
			<a href="<$Model.Settings.Url5$>" title="<$Model.Settings.Name5$>"><$Model.Settings.Name5$></a>
		</li>
	<$endif$>


	<$if (Model.Settings.Name6!="" && Model.Settings.Url6!="")$>
		<li>
			<a href="<$Model.Settings.Url6$>" title="<$Model.Settings.Name6$>"><$Model.Settings.Name6$></a>
		</li>
	<$endif$>


	<$if (Model.Settings.Name7!="" && Model.Settings.Url7!="")$>
		<li>
			<a href="<$Model.Settings.Url7$>" title="<$Model.Settings.Name7$>"><$Model.Settings.Name7$></a>
		</li>
	<$endif$>


	<$if (Model.Settings.Name8!="" && Model.Settings.Url8!="")$>
		<li>
			<a href="<$Model.Settings.Url8$>" title="<$Model.Settings.Name8$>"><$Model.Settings.Name8$></a>
		</li>
	<$endif$>


</ul>

<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>

<script type="text/javascript">
	jq$(function()
	{
		var customMenu = jq$('#<$Model.Id$>');

		customMenu.find('ul.orientationHorizontal').parents('.WaGadgetCustomMenu').addClass('customMenuHorizontal');
		customMenu.find('ul.orientationVertical').parents('.WaGadgetCustomMenu').addClass('customMenuVertical');

		customMenu.find('ul.alignLeft').parents('.WaGadgetCustomMenu').addClass('customMenuAlignLeft');
		customMenu.find('ul.alignCenter').parents('.WaGadgetCustomMenu').addClass('customMenuAlignCenter');
		customMenu.find('ul.alignRight').parents('.WaGadgetCustomMenu').addClass('customMenuAlignRight');

		customMenu.find('ul').wrap('<div class="outerContainer"></div>').before('<div class="toggleButton"></div>').wrap('<div class="container"></div>');

		var customMenuWidth = jq$('ul', customMenu).width(),
			customMenuHeight = jq$('ul', customMenu).height(),
			transitionTime = 300,
			animateOptionsToOpen,
			animateOptionsToClose,
			layoutType = ( customMenu.hasClass('customMenuHorizontal') ? 'horizontal' : 'vertical' ),
			menuContainer = customMenu.find('.container');

		customMenu.find('.toggleButton').toggle(function()
		{
			$(this).addClass('expandedState');
			getSize();
			setTypeAnimation();
			menuContainer.animate( animateOptionsToOpen, transitionTime );
		}, function()
		{
			$(this).removeClass('expandedState');
			getSize();
			setTypeAnimation();
			menuContainer.animate( animateOptionsToClose, transitionTime );
		});


		function getSize()
		{
			customMenuWidth = jq$('ul', customMenu).width();
			customMenuHeight = jq$('ul', customMenu).height();
		}

		function setTypeAnimation()
		{
			if( layoutType == 'horizontal' )
			{
				animateOptionsToOpen = { 'width': (customMenuWidth+'px') };
				animateOptionsToClose = { 'width': '0' };
			}

			if( layoutType == 'vertical' )
			{
				animateOptionsToOpen = { 'height': (customMenuHeight+'px') };
				animateOptionsToClose = { 'height': '0' };
			}
		}
	});
</script>





