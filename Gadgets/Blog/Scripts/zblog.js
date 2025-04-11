jq$(function() {
	// scroll if add comment
	if (jq$('.blogEntryContainer #idAddNewCommentFormContainer').size()) {
		$('body').animate({
			scrollTop: jq$("#idAddNewCommentFormContainer").offset().top
		}, 0);
	}

	jq$(document).ready(function() {
		MobileReplace();
	});


	function MobileReplace() {
		jq$('.WaGadgetBlog.WaGadgetBlogStateList .boxFooterPrimaryContainer a:contains("Comments")').html(function (index, html) {
			return html.replace('Comments ', '<span class="hiddenText">Comments </span>');
		});
		jq$('.WaGadgetBlog.WaGadgetBlogStateList .boxFooterPrimaryContainer a:contains("Add comment")').html(function (index, html) {
			return html.replace('Add comment', '<span class="hiddenText">Add comment</span>');
		});
	}
});
