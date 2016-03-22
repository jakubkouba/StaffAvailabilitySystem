/**
 * Created by wizard on 21/03/2016.
 */


var availability = function(){

    var
        $selectTimeButtons = $('.time-picker__input-label'),

        $timepicker = $('.timepicker'),
        $timepickerClose = $timepicker.children('.close'),

        $timepickerTime = $timepicker.find('.selected-time'),


        showTimepicker = function () {
            $timepicker.show();
        },

        closeTimepicker = function () {
            $timepicker.hide()
        },

        setTimeFromFromInput = function ($el) {
            $timepickerTime.text(
                $el.siblings('input').val()
            );
        },

        bindEvents = function(){

            $selectTimeButtons.click(function () {
                showTimepicker();
                setTimeFromFromInput($(this))
          });

            $timepickerClose.click(function () {
                closeTimepicker();
            });

        };

    return {
        init: function(){
            bindEvents();
        }
    }

};