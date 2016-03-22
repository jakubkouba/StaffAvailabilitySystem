/**
 * Created by wizard on 21/03/2016.
 */


var availability = function(){

    var
        $selectTimeButtons = $('.availability-calendar .select-time-button'),
        $timeMenu = $('.time-menu'),

        showTimeMenu = function(){
            $timeMenu.addClass('bounceIn');
        },

        bindEvents = function(){
          $selectTimeButtons.click(function(){
              showTimeMenu();
          });
        };

    return {
        init: function(){
            bindEvents();
            console.log($selectTimeButtons)
        }
    }

};