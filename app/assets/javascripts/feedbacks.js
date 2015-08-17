$(document).on('page:change', function() {
    $('.showable').on('click', function () {
        window.location.href = $(this).data('href');
    });

    //// get width of containing div
    //var width = $('#rating_buttons').width();
    //// get the number of radios in this group
    //var count = $('#rating_buttons input[type=radio]').length
    //// width of each element (take 5 extra pixels off to account for variations)
    //var radio_width = parseInt(width / count) - 80;
    //
    //// loop over each radio and set it to the new width
    //$('#rating_buttons input[type=radio]').each(function(){
    //    $(this).width(radio_width);
    //});
});