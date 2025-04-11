jq$(function () {

	var sidebar = jq$('.zoneSidebar'),
		main = jq$('.zoneMain');

	var animateOptionsToOpen = '300px',
		animateOptionsToClose = '50px',
		transitionTime = 300;

	if (!window.sidebarSettings) window.sidebarSettings = {};

	sidebarSettings = {
		animateOptionsToOpen: animateOptionsToOpen,
		animateOptionsToClose: animateOptionsToClose,
		transitionTime: transitionTime
	};

	var stateSidebar = localStorage.getItem('stateSidebar');

	function onAnimateComplete() {
		WA.Gadgets.notifySidebarResized();
	}

	if (stateSidebar == "expandedState") {
		sidebar.parent().addClass('sidebarExpanded');
		sidebar.css('width', animateOptionsToOpen);
		if (sidebar.hasClass('zoneSidebarLeft')) {
			main.css('padding-left', animateOptionsToOpen);
		} else {
			main.css('padding-right', animateOptionsToOpen);
		}
	} else {
		sidebar.parent().removeClass('sidebarExpanded');
		sidebar.css('width', animateOptionsToClose);
		if (sidebar.hasClass('zoneSidebarLeft')) {
			main.css('padding-left', animateOptionsToClose);
		} else {
			main.css('padding-right', animateOptionsToClose);
		}
	}

	jq$('.zoneSidebar').perfectScrollbar({suppressScrollX: true});

	if (sidebar.hasClass('zoneSidebarLeft')) {
		sidebar.css({
			'left': '0',
			'float': 'left',
			'margin-right': '-' + animateOptionsToOpen
		});
	} else {
		sidebar.css({
			'right': '0',
			'float': 'right',
			'margin-left': '-' + animateOptionsToOpen
		});
	}

	sidebar.find('.sidebarButton').click(function () {
		if (sidebar.parent().hasClass('sidebarExpanded')) {
			sidebar.parent().removeClass('sidebarExpanded');
			localStorage.setItem('stateSidebar', '');
			sidebar.animate({'width': animateOptionsToClose}, transitionTime, onAnimateComplete);
			sidebar.perfectScrollbar('update');
			if (sidebar.hasClass('zoneSidebarLeft')) {
				main.animate({'padding-left': animateOptionsToClose}, transitionTime);
			} else {
				main.animate({'padding-right': animateOptionsToClose}, transitionTime);
			}
		} else {
			sidebar.parent().addClass('sidebarExpanded');
			localStorage.setItem('stateSidebar', 'expandedState');
			sidebar.animate({'width': animateOptionsToOpen}, transitionTime, onAnimateComplete);
			sidebar.perfectScrollbar('update');
			if (sidebar.hasClass('zoneSidebarLeft')) {
				main.animate({'padding-left': animateOptionsToOpen}, transitionTime);
			} else {
				main.animate({'padding-right': animateOptionsToOpen}, transitionTime);
			}
		}
	});

	function MobileSidebar() {
		sidebar.addClass('zoneSidebarMobile');
		if (sidebar.hasClass('zoneSidebarLeft')) {
			main.addClass('zoneMainMobileLeft');
		} else {
			main.addClass('zoneMainMobileRight');
		}
		sidebar.parent().removeClass('sidebarExpanded');
		sidebar.css('width', '50px');
		if (sidebar.hasClass('zoneSidebarLeft')) {
			main.css('padding-left', '0');
		} else {
			main.css('padding-right', '0');
		}

		if (jq$(window).width() <= '750') {
			var sticky = 0,
				button = jq$('.zoneSidebarButton');

			jq$(window).scroll(function () {
				var top = jq$(this).scrollTop(),
					heightHeader = jq$('.mobilePanelContainer').height();

				if (top + sticky < heightHeader) {
					button.css('top', (heightHeader - top));
				} else {
					button.css('top', sticky);
				}
			});
		}
	}

	if (jq$(window).width() <= '750') {
		MobileSidebar();
	}

	jq$(window).resize(function () {
		if (jq$(window).width() <= '750') {
			sidebar.css('top', jq$('.mobilePanelContainer').height());
			MobileSidebar();
		} else {
			sidebar.css('top', 0);
			sidebar.removeClass('zoneSidebarMobile');
			main.removeClass('zoneMainMobileLeft').removeClass('zoneMainMobileRight');
			stateSidebar = localStorage.getItem('stateSidebar');
			if (stateSidebar == "expandedState") {
				sidebar.parent().addClass('sidebarExpanded');
				sidebar.css('width', animateOptionsToOpen);
				if (sidebar.hasClass('zoneSidebarLeft')) {
					main.css('padding-left', animateOptionsToOpen);
				} else {
					main.css('padding-right', animateOptionsToOpen);
				}
			} else {
				sidebar.parent().removeClass('sidebarExpanded');
				sidebar.css('width', animateOptionsToClose);
				if (sidebar.hasClass('zoneSidebarLeft')) {
					main.css('padding-left', animateOptionsToClose);
				} else {
					main.css('padding-right', animateOptionsToClose);
				}
			}
		}
	});

	function CloseMobileSidebar() {
		if (sidebar.hasClass('zoneSidebarMobile')) {
			if (sidebar.parent().hasClass('sidebarExpanded')) {
				sidebar.parent().removeClass('sidebarExpanded');
				sidebar.animate({'width': animateOptionsToClose}, transitionTime);
				if (sidebar.hasClass('zoneSidebarLeft')) {
					main.animate({'padding-left': animateOptionsToClose}, transitionTime);
				} else {
					main.animate({'padding-right': animateOptionsToClose}, transitionTime);
				}
			}
		}
	}

	jq$('.zoneMain').click(function () {
		CloseMobileSidebar();
	});
	jq$('.mobilePanel').click(function () {
		CloseMobileSidebar();
	});
	jq$('.mobilePanelButton').click(function () {
		CloseMobileSidebar();
	});

});
