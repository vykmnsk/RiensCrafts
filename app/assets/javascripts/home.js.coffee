mycarousel_initCallback = (carousel) ->	
	#Disable autoscrolling if the user clicks the prev or next button.
	carousel.buttonNext.bind 'click', ()->
		carousel.startAuto(0)

	carousel.buttonPrev.bind 'click', ()->
		carousel.startAuto(0)

	#Pause autoscrolling if the user moves with the cursor over the clip.
	carousel.clip.hover( ()-> 
		 carousel.stopAuto()
	, ()->
		carousel.startAuto()
	)

jQuery(document).ready ($) ->
	$("#banners").jcarousel {
		wrap: 'circular',
		scroll: 1,
		auto: 5
	}

