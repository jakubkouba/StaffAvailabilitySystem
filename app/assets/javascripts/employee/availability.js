/**
 * Created by wizard on 21/03/2016.
 */


var availability = function(){

    var
        $selectTimeButtons = $('.time-picker__input-label'),

        $timepicker = $('.timepicker'),
        $timepickerClose = $timepicker.children('.close'),
        $timepickerTime = $timepicker.find('.selected-time'),
        $hourButtons = $timepicker.find('.t-button.hour'),

        selectedTimeFromInput = {
            meridiem: 'am',
            hour: null,
            minute: null
        },


        getInputTime = function (time) {
            time = time.split(':');
            var
                hour = time[0],
                minute = time[1];

            selectedTimeFromInput.hour = hour;
            selectedTimeFromInput.minute = minute;
            selectedTimeFromInput.meridiem = (hour > 12)? 'pm' : 'am';
        },

        showTimepicker = function () {
            $timepicker.show();
        },

        closeTimepicker = function () {
            $timepicker.hide()
        },

        setTimeFromFromInput = function ($el) {
            getInputTime($el.siblings('input').val());
            $timepickerTime.children('span.hour').text(selectedTimeFromInput.hour);
        },

        setHour = function ($el) {
            $timepickerTime.text(
                $el.text()
            )
        },

        bindEvents = function(){

            $selectTimeButtons.click(function () {
                showTimepicker();
                setTimeFromFromInput($(this))
          });

            $timepickerClose.click(function () {
                closeTimepicker();
            });

            $hourButtons.click(function () {
                setHour($(this));
            })

        };

    return {
        init: function(){
            bindEvents();
        }
    }

};