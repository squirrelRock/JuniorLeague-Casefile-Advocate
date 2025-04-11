jq$(function() {
	// replace nbsp-s with spaces
	jq$('.WaGadgetEvents .generalFieldsContainer .fieldSubContainer .fieldLabel').each(function(k,v){ jq$(v).html(jq$(v).html().replace('&nbsp;',' '))});

	// move "Show details"
	jq$('.WaGadgetEventsStateList ul.boxesList li').each(function() {
		var footer = $(this).find('.boxFooterOuterContainer');
		$(this).find('.boxBodyContentContainer').after(footer);
	});

	// event details column height for colored border
	function resizeLeftColEventDetail() {
		var leftEventDetailsColumnDiv = jq$('.WaGadgetEventsStateDetails .boxOuterContainer .boxBodyInfoOuterContainer .boxBodyInfoContainer');
		var rightEventDetailsColumnDiv = jq$('.WaGadgetEventsStateDetails .boxOuterContainer .boxBodyContentOuterContainer .boxBodyContentContainer');

		if (leftEventDetailsColumnDiv.length && rightEventDetailsColumnDiv.length) {
			var leftEventDetailsColumnHeight = leftEventDetailsColumnDiv.height();
			var rightEventDetailsColumnHeight = rightEventDetailsColumnDiv.height();
			if (rightEventDetailsColumnHeight > leftEventDetailsColumnHeight) leftEventDetailsColumnDiv.css('height', rightEventDetailsColumnHeight);
		}
	}

	// event list column height for colored border
	function resizeLeftColEventList()
	{
		jq$('.WaGadgetEventsStateList .boxesList .boxesListItem').each(function (k, v) {
			var left = jq$(this).find('.boxBodyInfoContainer');
			var right = jq$(this).find('.boxBodyContentOuterContainer');
			if (right.height() > left.height()) left.css('height', right.height());
		});
	}

	// resizeLeftColEventDetail();
	// resizeLeftColEventList();
	//
	// jq$(window).resize(function()
	// {
	// 	resizeLeftColEventDetail();
	// 	resizeLeftColEventList();
	// });

	// delete empty past events
	if (jq$('#idPastEventsContainer table td').size() == 0) {
		jq$('#idPastEventsContainer').remove();
	}

	// event calendar effects
	jq$('.WaGadgetEventsStateCalendar .monthViewType .EventListCalendar td > div').addClass('eventDivItem');

	jq$('.WaGadgetEventsStateCalendar .monthViewType .EventListCalendar').on('click', 'td > div', function(e) {
		jq$(this).addClass('eventDivItem');

		if (e.target.tagName.toLowerCase() != 'a') {
			jq$(this).find('a')[0].click();
		}
	});

	// ellipsis for ie
	jq$('.WaGadgetEventsStateCalendar .yearViewType .EventListCalendar td').each(function()
	{
		var htmlCode = jq$(this).html();
		htmlCode = htmlCode.replace(new RegExp('</a>[^<]','g'),'</a></span>');
		htmlCode = htmlCode.replace(new RegExp('<br>','g'),'<br><span>');
		jq$(this).html(htmlCode);
	});

	if (jq$('.WaGadgetEventsStateCalendar').length !== 0) {
		var prevContainer = jq$('.WaGadgetEventsStateCalendar .viewSwitchersTable .decButton a:contains("Previous")');
		var nextContainer = jq$('.WaGadgetEventsStateCalendar .viewSwitchersTable .incButton a:contains("Next")');

		prevContainer.html(prevContainer.html().replace('&lt; ',''));
		nextContainer.html(nextContainer.html().replace(' &gt;',''));
	}

	jq$('.EventListCalendar a.calendarDate').closest('td').parents('td').addClass('EventListCalendarDate');
	jq$('.EventListCalendar table div.eventDivItem').closest('td').parents('td').addClass('EventListCalendarEventDiv');
	jq$('.EventListCalendar > tbody > tr > td > div.eventDivItem').parents('td').addClass('EventListCalendarEventDiv');

	if (jq$('.registrationInfo li .regTypeLiLabel img.imgRegCodeRequired').length > 0) {
		jq$('.registrationInfo li .regTypeLiLabel img.imgRegCodeRequired').css('display', 'none');
		jq$('.registrationInfo li .regTypeLiLabel img.imgRegCodeRequired').parent().append('<p class="regTypeLiLabelImg">(Registration code required)</p>');
	}

});
