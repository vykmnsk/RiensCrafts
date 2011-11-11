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
		url_base = $('#refresh-labels-link').attr('href') 
		url_2click = url_base + this.value
		$('#refresh-labels-link').attr('href', url_2click).trigger('click')
		$('#refresh-labels-link').attr('href', url_base)

	
