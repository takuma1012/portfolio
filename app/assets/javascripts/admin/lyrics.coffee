# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#lyric_article_id', ->
	$.ajax(
		type: 'GET'
		url: '/admin/lyrics/get_tracks'
		data: {
		article_id: $(this).val()
		}
	).done (data) ->
		$('#lyric_track_id').html(data)