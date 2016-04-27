AvailabilityCalendar.TimeInput = React.createClass({

    render: function(){
        return(
            <input
                type="text"
                name="available-times[2016-04-26[from]]"
                id="time"
                defaultValue="00:00"
                disabled="disabled"
                className="time-picker__selected-time"
            />
        )
    }
});