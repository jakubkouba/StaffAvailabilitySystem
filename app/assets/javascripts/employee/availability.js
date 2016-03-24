/**
 * Created by wizard on 21/03/2016.
 */


var availability = function(){

    var
        $selectTimeButtons = $('.time-picker__input-label'),
        $timepicker = $('.timepicker'),
        timepicker = {
            $: $timepicker,
            close: $timepicker.children('.close'),
            time: {
                meridiem: {
                    buttons: $timepicker.find('.meridiem span'),
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

        currentTime = {
            meridiem: 'am',
            hour: null,
            minute: null,
            toString: function(){
                return this.hour + ':' + this.minute
            }
        },

        $currentInput = null,

        $availabilitySwitchers = $('.availability-switch .switcher'),

        getTimeInputsBySwitcher = function($switcher){
            var
                $inputFrom = $switcher.parent('.availability-switch')
                    .siblings('.select-time__from')
                    .find('input.time-picker__selected-time'),
                $inputTo = $switcher.parent('.availability-switch')
                    .siblings('.select-time__to')
                    .find('input.time-picker__selected-time');

            return [$inputFrom, $inputTo];
        },

        toggleTimeInput = function ($switcher) {
            var inputs = getTimeInputsBySwitcher($switcher);
            $.each(inputs, function(index, $input){
                $input.toggleAttribute("disabled");
            });
        },

        getInputTime = function (time) {
            time = time.split(':');
            var
                hour = time[0],
                minute = time[1];

            if (hour > 12) {
                currentTime.meridiem = 'pm';
                currentTime.hour = hour - 12;
            }
            else {
                currentTime.meridiem = 'am';
                currentTime.hour = hour;
            }
            currentTime.minute = minute;
        },

        showTimepicker = function () {
            timepicker.$.addClass('open');
        },

        closeTimepicker = function () {
            timepicker.$.removeClass('open');
        },

        setMeridiem = function (value) {
            var labels = ['am', 'pm'];
            if (labels.indexOf(value) != -1) {
                timepicker.time.meridiem[value].addClass('active').siblings().removeClass('active');
                currentTime.meridiem = value;
            }
        },

        setTimeFromFromInput = function (time) {
            getInputTime(time);
            timepicker.time.hour.text(currentTime.hour);
            timepicker.time.minute.text(currentTime.minute);
            setMeridiem(currentTime.meridiem);
        },

        setTimeFromTimepicker = function () {
            currentTime.hour = (currentTime.meridiem == "pm")
                ? parseInt(timepicker.time.hour.text()) + 12
                : timepicker.time.hour.text();

            currentTime.minute = timepicker.time.minute.text();
            if ($currentInput != null) {
                $currentInput.val(currentTime.toString());
            }
        },

        /*
            Simulates button click by adding and subsequently removing .click class
            on $el element
         */
        simulateClick = function($el){
            var $button = $el.addClass('click');
            setTimeout(function(){
                $button.removeClass('click');
            }, 200)
        },

        /*
         Execute click event on time or minute button
         based on type

         @param $el clicked button jQ object
         @param type "minute" || "hour"
         */
        clickTimeButton = function($el, type){
            // set chosen value
            var value = $el.children('input[name=' + type + ']').val();
            timepicker.time[type].text(value);

            // simulate click
            simulateClick($el);
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
                clickTimeButton($(this), 'hour');
            });

            timepicker.minuteButtons.click(function(){
                clickTimeButton($(this), 'minute');
            });

            timepicker.time.meridiem.buttons.click(function () {
                setMeridiem($(this).data().label);
            });

            timepicker.done.click(function (e) {
                e.preventDefault();
                simulateClick($(this));
                setTimeFromTimepicker();
                closeTimepicker();
            });

            $availabilitySwitchers.click( function(){
                toggleTimeInput($(this));
            });

        };

    return {
        init: function(){
            bindEvents();
        }
    }

};