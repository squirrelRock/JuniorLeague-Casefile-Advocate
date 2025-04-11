(function (window)
{
	if (!window.PhotoAlbumGadgetHelperScript)
	{
		window.PhotoAlbumGadgetHelperScript = new photoAlbumGadgetHelper();
	}

	function photoAlbumGadgetHelper ()
	{
		var pThis = this;
		pThis.init = init;


		function init ()
		{
			BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, render);
		}

		function render ()
		{
			setScroll();
			setLabels();
			galleryAlbum();
			photoAlbumObjectFit();
		}


		function setScroll () {
			if (jq$('.WaGadgetPhotoAlbumStatePhoto .editCaptionTextBox').size()) {
				$('body').animate({
					scrollTop: $(".WaGadgetPhotoAlbumStatePhoto .editCaptionTextBox").offset().top
				}, 0);
			}
		}

		function setLabels () {
			jq$('.WaGadgetPhotoAlbumStatePhoto .pageBackContainer a:contains("All album photos")').html('All album photos');
			jq$('.WaGadgetPhotoAlbumStatePhoto .linkContainer a:contains("Previous"), .WaGadgetPhotoAlbumStatePhoto .linkContainer span:contains("Previous")').html('Previous');
			jq$('.WaGadgetPhotoAlbumStatePhoto .linkContainer a:contains("Next"), .WaGadgetPhotoAlbumStatePhoto .linkContainer span:contains("Next")').html('Next');
			jq$('.WaGadgetPhotoAlbumStatePhoto .buttonsInTitleContainer input[value="Delete photo"]').val('Delete');
		}

		function photoAlbumObjectFit () {
			if (document.documentMode || /Edge/.test(navigator.userAgent)) {
				if (jq$('.WaGadgetPhotoAlbum.PhotoAlbumStyle001').length > 0) {
				    jq$('.imageAnchor img').each(function(){
				        var t = jq$(this),
				            s = 'url(' + t.attr('src') + ')',
				            p = t.parent(),
				            d = jq$('<div></div>');

				        p.append(d);
				        d.css({
				            'height'                : t.parent().css('height'),
				            'background-size'       : 'cover',
				            'background-repeat'     : 'no-repeat',
				            'background-position'   : '50% 20%',
				            'background-image'      : s
				        });
				        t.hide();
				    });
				}
			}
		}

		function galleryAlbum () {
			if (jq$('.WaGadgetPhotoAlbum.PhotoAlbumStyle002').length > 0) {
				jq$('.photosContainerUL').prepend('<li class="photoAlbumItemContainerLiSizer"></li><li class="photoAlbumItemContainerLiGutter"></li>');
				var $grid = $('.photosContainerUL').imagesLoaded( function() {
					// init Masonry after all images have loaded
					$grid.masonry({
						itemSelector: '.photoAlbumItemContainerLi',
						columnWidth: '.photoAlbumItemContainerLiSizer',
						gutter: '.photoAlbumItemContainerLiGutter',
						percentPosition: true
					});
				});

				jq$('#idPhotoHeaderContainer').append(jq$('.infoContainer'));
				jq$('#idPhotoHeaderContainer').wrapInner('<div class="photoHeaderContainerWrap"></div>');
				jq$('#idPhotoHeaderContainer .infoContainer').wrap('<div class="infoContainerWrap"></div>');
				if (jq$('.buttonsInTitleContainer input').length > 0) {
					jq$('.photoHeaderContainerWrap').css('margin-right', '52px');
					jq$('#idPhotoHeaderContainer').append('<a href="#" class="photoAlbumDeleteButton" title="Delete photo"></a>');
				}

				jq$('.imageContainer').append(jq$('.menuHeaderLeftContainer .linkContainer:first'));
				jq$('.imageContainer').append(jq$('.menuHeaderLeftContainer .linkContainer:last'));

				if (jq$('.footerContainer a:contains("Edit")').length > 0) {
					jq$('.footerContainer a:contains("Edit")').addClass('noneEdit');
					jq$('.captionContainer').append('<a href="#" class="photoAlbumEditCaptionButton" title="Edit caption"></a>');
				}

				if (jq$('#idCaptionContainer .photoLabel').html() === "") {
					jq$('.photoLabel').css('display', 'none');
				}

				jq$('.photoAlbumEditCaptionButton').click(function () {
					$('.footerContainer a')[0].click();
				});
				jq$('.photoAlbumDeleteButton').click(function () {
					$('.buttonsInTitleContainer input').trigger('click');
				});
			}
		}
	}

})(window);
