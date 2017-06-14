class NoticeWrapper extends React.Component {
  constructor(props) {
    super(props);

    this.state = { slideUp: false };
  }
  componentWillMount() {
    setTimeout(() => {
      this.setState({ slideUp: true });
    }, 3500);
  }

  render () {
    if (this.state.slideUp) {
      return (
        <div className={`notice-wrapper-${this.props.type}`}>
          {this.props.message}
        </div>
      );
    } else {
      return (
        <p className={`notice-wrapper-${this.props.type}`}>
          {this.props.message}
        </p>
      );
    }
  }

}

NoticeWrapper.propTypes = {
  message: React.PropTypes.string.isRequired,
  type: React.PropTypes.string
};




