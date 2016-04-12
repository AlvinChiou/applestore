## Place all the behaviors and hooks related to the matching controller here.
## All this logic will automatically be available in application.js.
## You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  filter_township = ->
    county = $('#order_info_attributes_billing_county_id :selected').text()
    escaped_county = county.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(township).filter("optgroup[label='#{escaped_county}']").html()
    if options
      $('#order_info_attributes_billing_township_id').html(options)
      $('#order_info_attributes_billing_township_id').parent().show()
    else
      $('#order_info_attributes_billing_township_id').empty()
      $('#order_info_attributes_billing_township_id').html('<option value=""></option>')
      $('#order_info_attributes_billing_township_id').parent().hide()

  $('#order_info_attributes_billing_township_id').parent().hide()
  township = $('#order_info_attributes_billing_township_id').html()

  if $('#order_info_attributes_billing_county_id').val() != ''
    filter_township()
  $('#order_info_attributes_billing_county_id').change ->
    filter_township()

#$ ->
#  filter_township = ->
#    county = $('.select-county :selected').text()
#    escaped_county = county.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
#    options = $(township).filter("optgroup[label='#{escaped_county}']").html()
#    if options
#      $('.select-township').html(options)
#      $('.select-township').parent().show()
#    else
#      $('.select-township').empty()
#      $('.select-township').html('<option value=""></option>')
#      $('.select-township').parent().hide()
#
#  $('.select-township').parent().hide()
#  township = $('.select-township').html()
#
#  if $('.select-township').val() != ''
#    filter_township()
#  $('.select-township').change ->
#    filter_township()