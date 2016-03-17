/**
 * Created by wizard on 16/03/2016.
 */

var mainMenu = function () {
    var
        menuToggle = $('.menu-toggle'),
        menu = $('.main-menu'),
        openMenuClass = 'open-menu',

        openMenu = function () {
            menu.toggleClass(openMenuClass);
        },

        bindEvents = function () {
            menuToggle.click(function () {
                openMenu();
            })
        };


    return {
        init: function () {
            bindEvents();
        }
    }

};