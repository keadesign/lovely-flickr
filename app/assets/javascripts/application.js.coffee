# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require bootstrap
#= require_tree .

$ ->
  $('#query').autocomplete
    source: (request, autocomplete) ->
      queryTerm = request.term

      $.ajax
        url: "/photos/search?query=#{queryTerm}"
        dataType: 'json'
        success: (searchResults) ->
          titles = []
          for result in searchResults
            titles.push(result.title)

          autocomplete(titles)

# autocomplete is a jquery ui widget, see jueryui site
