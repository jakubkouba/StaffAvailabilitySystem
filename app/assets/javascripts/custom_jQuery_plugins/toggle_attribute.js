/**
 * Created by wizard on 24/03/2016.
 */

/*
 This plugin is taken from https://gist.github.com/mathiasbynens/298591

 It facades "attr" and "removeAttr" to create a toggleAttribute method
 */

(function ($) {
    $.fn.toggleAttribute = function (attr) {
        this.each(function () {
            var $this = $(this);
            $this.attr(attr) ? $this.removeAttr(attr) : $this.attr(attr, attr);
        });

        return this;
    };
}(jQuery));