var TimeInput = React.createClass({

    render: function(){
        return(
            <div className={ "select-time__" + this.props.prefix} >
                <div className="title">{this.props.prefix}</div>
                <div className="time-picker">
                    <input
                        type="text"
                        name="available-times[2016-04-26[from]]"
                        id="time"
                        value={this.props.time}
                        disabled={this.props.disabled}
                        className="time-picker__selected-time"
                    />
                    <span className="time-picker__input-label">
                        <span className="fi-clock"></span>
                    </span>
                </div>
            </div>
        )
    }
});