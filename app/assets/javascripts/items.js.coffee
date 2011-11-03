jQuery(document).ready ($) ->

	#Ajax
	$('#refresh-labels-link').bind 'ajax:beforeSend', (evt, xhr, settings)->
		$('#ajaxmsg').html('Updating Labels...')
		
	$('#refresh-labels-link').bind 'ajax:success', (evt, data, status, xhr)->
		$('#group-labels').html(data)

	$('#refresh-labels-link').bind 'ajax:error', (evt, xhr, status, error)->
		$('#group-labels').html(error)

	$('#refresh-labels-link').bind 'ajax:complete', (evt, xhr, status)->
		$('#ajaxmsg').html('')

	#Group Radio
	$("input:radio[name='item[group_id]']").click ()->
		complete_url = $('#refresh-labels-link').attr('href') + this.value
		$('#refresh-labels-link').attr('href', complete_url).trigger('click')

	
