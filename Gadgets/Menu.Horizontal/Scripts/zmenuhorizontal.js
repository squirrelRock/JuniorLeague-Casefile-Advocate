jq$(function () {
	if (jq$('.WaGadgetMenuHorizontal .stickyMenu').length > 0) {
		var sticky = 0,
			menu = jq$('.stickyMenu'),
			heightHeader = jq$('.stickyMenu').offset().top;

		jq$(window).scroll(function () {
			var top = jq$(this).scrollTop();

			if (top + sticky <= heightHeader) {
				menu.css({'top': '', 'position': 'relative', 'left': '', 'width': '', 'border-right': '', 'border-left': ''});
				menu.removeClass('active');
			} else {
				menu.css({'top': sticky, 'position': 'fixed'});
				menu.addClass('active');

				if (jq$('.zoneMain').length > 0) {
					var widthSidebar = jq$('.zoneSidebar').width(),
            			colorBorder = jq$('.stickyMenu.active').css('border-bottom-color');

					if (parseInt(jq$('.zoneMain').css('padding-left')) === 0) {
						menu.css({
							'width': 'calc(100% - ' + widthSidebar + 'px)',
							'border-right': '1px solid ' + colorBorder
						});
					} else {
						menu.css({
							'left': widthSidebar,
							'width': 'calc(100% - ' + widthSidebar + 'px)',
							'border-left': '1px solid ' + colorBorder
						});
					}
				}
			}
		});

		jq$('.sidebarButton').click(function () {
			if (jq$('.stickyMenu').hasClass('active')) {
				if (!sidebarSettings) return;

				if (jq$('.zoneSidebar').parent().hasClass('sidebarExpanded')) {
					var menuWidthOpen = $(window).width() - parseInt(sidebarSettings.animateOptionsToOpen);

					if (parseInt(jq$('.zoneMain').css('padding-left')) === 0) {
						menu.animate({'width': menuWidthOpen}, sidebarSettings.transitionTime);
					} else {
						menu.animate({'left': sidebarSettings.animateOptionsToOpen, 'width': menuWidthOpen}, sidebarSettings.transitionTime);
					}
				} else {
					var menuWidthClose = $(window).width() - parseInt(sidebarSettings.animateOptionsToClose);

					if (parseInt(jq$('.zoneMain').css('padding-left')) === 0) {
						menu.animate({'width': menuWidthClose}, sidebarSettings.transitionTime);
					} else {
						menu.animate({'left': sidebarSettings.animateOptionsToClose, 'width': menuWidthClose}, sidebarSettings.transitionTime);
					}
				}
			}
		});

		if (jq$('.stickyMenu').hasClass('active')) {
			jq$(window).resize(function () {
				if (!sidebarSettings) return;

				if (jq$('.zoneSidebar').parent().hasClass('sidebarExpanded')) {
					var menuWidthOpen = $(window).width() - parseInt(sidebarSettings.animateOptionsToOpen);

					if (parseInt(jq$('.zoneMain').css('padding-left')) === 0) {
						menu.css({
							'width': menuWidthOpen
						});
					} else {
						menu.css({
							'left': sidebarSettings.animateOptionsToOpen,
							'width': menuWidthOpen
						});
					}
				} else {
					var menuWidthClose = $(window).width() - parseInt(sidebarSettings.animateOptionsToClose);

					if (parseInt(jq$('.zoneMain').css('padding-left')) === 0) {
						menu.css({
							'width': menuWidthClose
						});
					} else {
						menu.css({
							'left': sidebarSettings.animateOptionsToClose,
							'width': menuWidthClose
						});
					}
				}
			});
		}
	}
});
