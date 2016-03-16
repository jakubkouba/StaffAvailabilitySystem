/**
 * Created by wizard on 16/03/2016.
 */

var mainMenu = function () {
    var
        menuToggle = $('.menu-toggle'),
        menu = $('.main-menu'),
        openMenuClass = 'open-menu',

        showMenu = function () {
            menu.toggleClass(openMenuClass);
        },

        bindEvents = function () {
            menuToggle.click(function () {
                showMenu();
            })
        };


    return {
        init: function () {
            bindEvents();
        }
    }

};