var $TABLE = $('#table');
var $BTN = $('#export-btn');
var $EXPORT = $('#export');
var $MAINLIST = $('.mainlist');


function clonePlaylist(currPL) {
  
  currPlaylist = currPL.value;
  console.log(currPlaylist);
  var $clone = $MAINLIST.find('.hide').clone(true).removeClass('hide');
  $MAINLIST.append($clone);

}

// A few jQuery helpers for exporting only
jQuery.fn.pop = [].pop;
jQuery.fn.shift = [].shift;

$BTN.click(function () {
  var $rows = $TABLE.find('tr:not(:hidden)');
  var headers = [];
  var data = [];
  
  // Get the headers (add special header logic here)
  $($rows.shift()).find('th:not(:empty)').each(function () {
    headers.push($(this).text().toLowerCase());
  });
  
  // Turn all existing rows into a loopable array
  $rows.each(function () {
    var $td = $(this).find('td');
    var h = {};
    
    // Use the headers from earlier to name our hash keys
    headers.forEach(function (header, i) {
      h[header] = $td.eq(i).text();   
    });
    
    data.push(h);
  });
  
  // Output the result
  $EXPORT.text(JSON.stringify(data));
});

function displayPlaylist(playlistName) {
  $("#name").html(playlistName);
  
}

// function createPlaylist() {
//   var playlistName = document.getElementsByName("playlistName")[0].value;
//   console.log(playlistName);
//   $("#name").html(playlistName);
