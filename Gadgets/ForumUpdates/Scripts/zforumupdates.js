jq$(function () {
	if (jq$('.WaPlaceHolderSidebar').length > 0) {
		jq$('.zoneMain .forumUpdatesStyle003, .zoneMain .forumUpdatesStyle006').find('ul').slick({
			dots: true,
			speed: 300,
			slidesToShow: 4,
			slidesToScroll: 4,
			responsive: [
				{
					breakpoint: 992,
					settings: {
						slidesToShow: 3,
						slidesToScroll: 3
					}
				},
				{
					breakpoint: 768,
					settings: {
						slidesToShow: 2,
						slidesToScroll: 2
					}
				},
				{
					breakpoint: 480,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1
					}
				}
			]
		});
		jq$(function () {
			jq$('.WaPlaceHolderSidebar .forumUpdatesStyle003, .WaPlaceHolderSidebar .forumUpdatesStyle006').find('ul').slick({
				dots: true,
				speed: 300,
				slidesToShow: 1,
				slidesToScroll: 1
			});
		});
	} else {
		jq$('.forumUpdatesStyle003, .forumUpdatesStyle006').find('ul').slick({
			dots: true,
			speed: 300,
			slidesToShow: 4,
			slidesToScroll: 4,
			responsive: [
				{
					breakpoint: 992,
					settings: {
						slidesToShow: 3,
						slidesToScroll: 3
					}
				},
				{
					breakpoint: 768,
					settings: {
						slidesToShow: 2,
						slidesToScroll: 2
					}
				},
				{
					breakpoint: 480,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1
					}
				}
			]
		});
	}
});