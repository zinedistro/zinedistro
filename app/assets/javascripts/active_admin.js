//= require active_admin/base
//= require select2

$(document).ready(function () {
  return $('#zine_author_ids').select2({
    allowClear: true
  });
});
