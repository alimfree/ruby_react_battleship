import React from "react"
import PropTypes from "prop-types"
class Board extends React.Component {
  componentDidMount() {
    console.log(this);
    // set el height and width etc.
    this.drawBoard();
  }

  render () {
    return (
      <div>
        <h1>{this.title()}</h1>
        <br></br>
        <canvas id={this.props.name} width="420px" height="420px"></canvas>
      </div>
    );
  }

  title () {
    name = this.props.name
    return name.charAt(0).toUpperCase() + name.slice(1);
  }

  drawBoard(){
      var canvas = document.getElementById(this.props.name);
      var context = canvas.getContext("2d");
      var bw = 400;
      var bh = 400;
      var p = 10;
      var cw = bw + (p*2) + 1;
      var ch = bh + (p*2) + 1;
      for (var x = 0; x <= bw; x += 40) {
          context.moveTo(0.5 + x + p, p);
          context.lineTo(0.5 + x + p, bh + p);
      }


      for (var x = 0; x <= bh; x += 40) {
          context.moveTo(p, 0.5 + x + p);
          context.lineTo(bw + p, 0.5 + x + p);
      }

      context.strokeStyle = "black";
      context.stroke();
    }
}

Board.propTypes = {
  name: PropTypes.node
};
export default Board
