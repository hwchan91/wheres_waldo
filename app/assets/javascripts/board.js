Paloma.controller('Boards', {
  show: function(){
    var char_count, identified, identified_count, time, clicked, score_id;
    init();

    function init() {
      char_count = $('.character').length;
      identified = {};
      identified_count = 0;
      time = -0.01;
      clicked = false;
      setBoardWidth();
      clickListener();
      count_time();
    }

    function setBoardWidth() {
      var board_width = $('.board img').width()
      $('.board').width(board_width)
    }

    function clickListener() {
      $('.board img').on('click', checkClick)
    }

    function checkClick(e) {
      var board_offset, top, left;
      board_offset = $('.board img').offset();
      top = e.pageY - board_offset.top;
      left = e.pageX - board_offset.left;
      var query = {
        board_id: $('.board').data('boardid'),
        top: top,
        left: left
      }
      console.log("clicked", "top", top, "left", left)
      sendQuery(query);
    }

    function sendQuery(query) {
      $.getJSON( "/check_char.json", query).done(function(data) {
        console.log(data);
        if (data && !(data.name in identified)) {
          highlightClicked(query.top, query.left, false);
          identified[data.name] = true;
          identified_count = Object.keys(identified).length
          if (identified_count == char_count) {
            $('.' + data.name).hide('slow', function() {
              $('.char_table').hide();
            })
            foundAll();
          } else {
            $('.' + data.name).hide('slow')
          }
        } else {
          highlightClicked(query.top, query.left, true);
        }
      })
    }

    function count_time() {
      time = Math.round((time + 0.01) * 1e12) / 1e12
      $('.timer').text(time);
      timer = setTimeout(function() {
                count_time()
              }, 10);
    }

    function foundAll() {
      clearTimeout(timer);
      $('.board img').off('click', checkClick);
      time = time.toFixed(2);
      console.log("Found all in " + time + " s");
      submitScore('', 'false')
      displayForm();
      saveScore();
    }

    function highlightClicked(top, left, fadeout) {
      if (!clicked) {
        toggleClicked();
        var circle = $("<div class='selector-circle' style='left:" + left +"px; top:" + top + "px'></div>")
        circle.appendTo($('.img_container'));
        setTimeout(function() {
          circle.addClass("scale");
        }, 50);
        if (fadeout) {
          setTimeout(function() {
             circle.fadeOut();
           }, 450);
        }
      }
    }

    function toggleClicked() {
      clicked = true;
      setTimeout(function(){
        clicked = false;
      }, 450);
    }

    function displayForm() {
      $('.score').text(time);
      $('.modal').show();
    }

    function saveScore() {
      saveScoreDirectly();
      saveScoreOnReturn();
      toScoreboard();
    }

    function saveScoreDirectly() {
      $(window).keydown(function(event){
        if( (event.keyCode == 13) && ($('#player').is(':focus')) ) {
          event.preventDefault();
          updateScore(true);
        }
      });
    }

    function toScoreboard() {
      $('#scoreboard').on('click', function(event) {
        event.preventDefault();
        //popupCloseListener();
        updateScore(true);
      })
    }

    function saveScoreOnReturn() {
      $('#play_again').on('click', function(event) {
        event.preventDefault();
        updateScore(false);
      })
    }

    function updateScore(display_popup) {
      var player = $('#player').val()
      submitScore(player, display_popup)
    }

    function popupScoreboard() {
      console.log("getting popup")
      data = {
        board_id: $('.board').data('boardid'),
        score_id: score_id
      }
      $.get( "/popup_score", data)
    }

    function submitScore(player_name, display_popup) {
      score = {
        board_id: $('.board').data('boardid'),
        score: time,
        player: player_name,
        score_id: score_id,
        //link_to: page,
        popup: display_popup
      }
      if (display_popup == "true") { $('.modal_body').text("") }
      $.post( "/save_score", score).done(function(data) {
        score_id = data.score_id
        console.log("score saved, score_id: ", score_id)
      }).fail(function(xhr, status) {
          alert( "Sorry, there was a problem!" );
          console.log( "Status: " + status );
          console.dir( xhr );
      })
    }

    function popupCloseListener() {
      setInterval(function() {
        if ($('.close_popup_btn').length) {
          $('.close_popup_btn').show();
          $('.close_popup_btn').on('click', function() {
            $('.score_popup').remove();
          });
        }
      }, 100)
    }

//    function popupReturnHome() {
//      setInterval(function() {
//        if ($('.close_popup_btn').length) {
//          $('.close_popup_btn').remove();
//          $('.score_popup').append($('<a href="/" class="btn" id="play_again">Play another board!</a>').css("margin-top", "20px"))
//        }
//      }, 200)
//    }





  }
});
