import React from "react"
import PropTypes from "prop-types"
class Ship extends React.Component {
  render () {
    return (
      <React.Fragment>
        Size: {this.props.size}
        Orinetation: {this.props.orinetation}
        Health: {this.props.health}
        Type: {this.props.type}
        Coordinates: {this.props.coordinates}
      </React.Fragment>
    );
  }

  horizontal () {
    this.props.orientation ? true : false
  }

  place_ship(coordinates) {
    //todo 
  }
}

Ship.propTypes = {
  size: PropTypes.node,
  orientation: PropTypes.bool,
  health: PropTypes.node,
  type: PropTypes.string,
  coordinates: PropTypes.object
};
export default Ship
