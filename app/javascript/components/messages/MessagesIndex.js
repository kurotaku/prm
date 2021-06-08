import React from "react"
import PropTypes from "prop-types"

class MessagesIndex extends React.Component {
  constructor(props){
    super(props)
    this.INTERVAL = 60 * 1000;
    this.state = {
      related_object: props.related_object,
      related_object_uid: props.related_object_uid,
      board_uid: '',
      messages: [],
      form: {
        content: ''
      },
    };
  }

  componentDidMount(){
    this.getBoardMessages(this.state.related_object, this.state.related_object_uid);
    this.intervalId = setInterval(()=>{
      this.getBoardMessages(this.state.related_object, this.state.related_object_uid);
    }, this.INTERVAL);
  }

  componentWillUnmount(){
    clearInterval(this.intervalId);
  }

  getBoardMessages(related_object, related_object_uid){
    fetch('/api/v1/boards/' + related_object + '/' + related_object_uid + '.json')
    .then(response => {return response.json()} )
    .then(data => {this.setState({ messages: data.messages, board_uid: data.uid })} )
    .catch(error => {
      console.log('getBoardMessages ERROR:', error);
    });
  }

  handleChange(e, key){
    let target = e.target;
    let value = target.value;
    let form = this.state.form;
    form[key] = value;

    this.setState({
      form: form
    });
  }

  handleCreate(){
    let body = JSON.stringify({
      message: {
        content: this.state.form.content
      },
      board: {
        uid: this.state.board_uid
      },
    })
    
    fetch('/api/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: body
    })
    .then(response => {
      return response.json()
    })
    .then(message => {
      this.addMessage(message);
      this.formReset();
    })
    .catch( error => {
      console.log('CREATE ERROR:', error);
    })
  }

  addMessage(message){
    this.setState({
      messages: this.state.messages.concat(message)
    })
  }

  formReset(){
    this.setState({
      form: {
        content: ""
      },
      // editForm: {
      //   uuid: false
      // }
    })
  }

  render () {
    return (
      <React.Fragment>
        <BoardMessageList
          messages={this.state.messages}
        />
        <div className="form-wrap">
          <input type="text" placeholder="入力してください" value={this.state.form.content} onChange={ e => this.handleChange(e, 'content')} />
          <p className="text-right"><button className="submit" onClick={() => this.handleCreate()}>送信</button></p>
        </div>
      </React.Fragment>
    );
  }
}

export default MessagesIndex

function BoardMessageList(props){
  return(
    <div>
      <ul className="message-list">
        {props.messages.map( message => {
          return(
            <li
              key={message.uid}
            >
              <div className="user-info"><img src={message.staff_thumbnail} className="thumb" /><h3>{message.staff_name}</h3></div>
              <p className="date">{message.create_datetime}</p>
              <p className="content">{message.content}</p>
            </li>
          )
        })}
      </ul>
    </div>
  )
}