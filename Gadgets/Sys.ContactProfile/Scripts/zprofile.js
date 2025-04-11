jq$(function() {
	if (jq$('.WaGadgetContactProfileStatePhotoGallery .editCaptionTextBox').size()) {
		$('body').animate({
			scrollTop: $(".WaGadgetContactProfileStatePhotoGallery .editCaptionTextBox").offset().top
		}, 0);
	}
});
jq$(function() {
	jq$('.WaGadgetContactProfileStatePhotoGallery .pageBackContainer a:contains("All album photos")').html('All album photos');
	jq$('.WaGadgetContactProfileStatePhotoGallery .linkContainer a:contains("Previous"), .WaGadgetContactProfileStatePhotoGallery .linkContainer span:contains("Previous")').html('Previous');
	jq$('.WaGadgetContactProfileStatePhotoGallery .linkContainer a:contains("Next"), .WaGadgetContactProfileStatePhotoGallery .linkContainer span:contains("Next")').html('Next');
});

jq$(function() {
	if (document.documentMode || /Edge/.test(navigator.userAgent)) {
		if (jq$('#idPhotoGalleryMainSectionContainer').length > 0) {
			jq$('img.photoGalleryItemThumbnailImage').each(function () {
				var t = jq$(this),
					s = 'url(' + t.attr('src') + ')',
					p = t.parent(),
					d = jq$('<div></div>');

				p.append(d);
				d.css({
					'height': t.parent().css('height'),
					'background-size': 'cover',
					'background-repeat': 'no-repeat',
					'background-position': '50% 20%',
					'background-image': s
				});
				t.hide();
			});
		}

		if (jq$('#idPhotoAlbumMainSectionContainer').length > 0) {
			jq$('img.photoAlbumItemThumbnailPhoto').each(function () {
				var t = jq$(this),
					s = 'url(' + t.attr('src') + ')',
					p = t.parent(),
					d = jq$('<div></div>');

				p.append(d);
				d.css({
					'height': t.parent().css('height'),
					'background-size': 'cover',
					'background-repeat': 'no-repeat',
					'background-position': '50% 20%',
					'background-image': s
				});
				t.hide();
			});
		}
	}
});
