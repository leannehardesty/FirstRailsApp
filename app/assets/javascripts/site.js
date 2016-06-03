

$(document).on('ready page:load', function(){
    // $('.rating').raty();  
    //$('.rating').raty( { path: '/assets' });
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
});


