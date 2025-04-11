jq$(function() {
	jq$("td.repliesCountTD .repliesCount:contains('—')").addClass("noBubble");
	jq$("td.threadImageTD .threadImage.stickyForumTopic").parent().next().addClass("showStickyIcon");

	// copy content table TD to header table for mobile view
	jq$('.WaGadgetForum.WaGadgetForumStateMessageList .boxesList .boxesListItem').each(function() {
		var forumMessageHeaderInfoContainer = $(this).find('table.forumMessageHeaderTable td.forumMessageHeaderInfoContainer');
		$(this).find('table.forumMessageTable td.left').clone().addClass('forumMessageHeaderInfoContainerAuthorPhantom').insertAfter(forumMessageHeaderInfoContainer);
	});

	// effect for control panel
	jq$('.WaGadgetForum.WaGadgetForumStateMessageList .boxesList .boxesListItem table.forumMessageHeaderTable td.forumMessageHeaderBodyContainer').each(function() {
		forumPanel(this);
	});

	function forumPanel(element) {
		$(element).before('<td class="forumMessageHeaderBodyContainerPhantom"><div class="controlPanel"><div class="toggleButton"><div class="controlPanelInner"></div></div></div></td>');

		var linkEdit = $(element).find('a[id*=forumMessage_edit]').addClass('Edit').wrapInner("<span></span>"),
			linkMove = $(element).find('a[id*=forumMessage_move]').addClass('Move').wrapInner("<span></span>"),
			linkDelete = $(element).find('a[id*=forumMessage_deleteLink]').addClass('Delete').wrapInner("<span></span>"),
			linkQuote = $(element).find('a[id*=forumMessage_reply]').addClass('Quote').wrapInner("<span></span>"),
			replyNumberSpan = $(element).find('span[id*=messageIdText]').addClass('replyNumberSpan');

		$(element).parent().find('.controlPanelInner').append(linkEdit);
		$(element).parent().find('.controlPanelInner').append(linkMove);
		$(element).parent().find('.controlPanelInner').append(linkDelete);
		$(element).parent().find('.controlPanelInner').append(linkQuote);
		$(element).parent().find('.controlPanel').prepend(replyNumberSpan);

		return false;
	}
});
