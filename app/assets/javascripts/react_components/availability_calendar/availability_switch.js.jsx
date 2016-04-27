var AvailabilitySwitch = React.createClass({

    render: function(){
        return(
            <div class="availability-switch">
                <input
                    type="checkbox"
                    name={this.props.name}
                    id={this.props.id}
                    value={this.props.value}
                    className="switch-input"
                    checked={this.props.checked}
                />
                <label className="switch-paddle switcher" for={this.props.id} >
                    <span aria-hidden="true" className="switch-active">Yes</span>
                    <span aria-hidden="true" className="switch-inactive">No</span>
                </label>
            </div>
        )
    }
});