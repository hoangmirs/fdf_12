$(document).on("ready page:load", $(function () {
  $('.dropdown-toggle').dropdown();
  $('#live-search-form').hsearchbox({
    url: '/search/',
    param: 'search',
    dom_id: '#livesearch',
    loading_css: '#livesearch_loading'
  });
}));
