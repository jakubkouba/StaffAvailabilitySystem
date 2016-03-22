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
            hourButtons: $timepicker.find('.t-button.hour'),
            minuteButtons: $timepicker.find('.t-button.minute'),
            done: $timepicker.find('.done')
        },

        selectedTimeFromInput = {
            meridiem: 'am',
            hour: null,
            minute: null
        },

        $currentInput = null,

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

        setTimeFromFromInput = function (time) {
            getInputTime(time);
            timepicker.time.hour.text(selectedTimeFromInput.hour);
            timepicker.time.minute.text(selectedTimeFromInput.minute);
            timepicker.time.meridiem[selectedTimeFromInput.meridiem].addClass('active').siblings().removeClass('active');
        },

        setTimeFromTimepicker = function () {
            if ($currentInput != null) {
                var time = timepicker.time.hour.text() + ':' + timepicker.time.minute.text();
                $currentInput.val(time);
            }
        },

        bindEvents = function(){

            $selectTimeButtons.click(function () {
                showTimepicker();
                var $input = $(this).siblings('input');
                setTimeFromFromInput($input.val());
                $currentInput = $input;
            });

            timepicker.close.click(function () {
                closeTimepicker();
                setTimeFromTimepicker();
            });

            timepicker.hourButtons.click(function () {
                var hour = $(this).children('input[name=hour]').val();
                timepicker.time.hour.text(hour);
            });

            timepicker.minuteButtons.click(function(){
                var minute = $(this).children('input[name=minute]').val();
                timepicker.time.minute.text(minute);
            });

            timepicker.done.click(function (e) {
                e.preventDefault();
                console.log('done clicked');
                setTimeFromTimepicker();
                closeTimepicker();
            });

        };

    return {
        init: function(){
            bindEvents();
        }
    }

};