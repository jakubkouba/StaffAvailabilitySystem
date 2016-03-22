/**
 * Created by wizard on 21/03/2016.
 */


var availability = function(){

    var
        $selectTimeButtons = $('.time-picker__input-label'),
        $timepicker = $('.timepicker'),
        timepicker = {
            self: $timepicker,
            close: $timepicker.children('.close'),
            time: {
                meridiem: {
                    am: $timepicker.find('.meridiem span.am'),
                    pm: $timepicker.find('.meridiem span.pm')
                },
                hour: $timepicker.find('.selected-time span.hour'),
                minute: $timepicker.find('.selected-time span.minute')
            },
            hourButtons: $timepicker.find('.t-button.hour')
        },

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
            timepicker.time.hour.text(selectedTimeFromInput.hour);
            timepicker.time.minute.text(selectedTimeFromInput.minute);
            timepicker.time.meridiem[selectedTimeFromInput.meridiem].addClass('active').siblings().removeClass('active');
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

            timepicker.close.click(function () {
                closeTimepicker();
            });

            timepicker.hourButtons.click(function () {
                setHour($(this));
            })

        };

    return {
        init: function(){
            bindEvents();
        }
    }

};