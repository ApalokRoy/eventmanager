
var Tasks = React.createClass({

  render: function() {
    return (
      <div id="table">
        <table className="tasks">
          <tbody>
            <tr>
              <th><h4> Name  </h4></th>
              <th colSpan = "2" ><h4> Status  </h4></th>
              <th><h4> Related Event  </h4></th>
              <th><h4> Person Assigned  </h4></th>
              <th><h4> Deadline  </h4></th>
            </tr>
            {this.props.tasks.map((task, i) => <TableRow key = {i} data = {task} />)}
          </tbody>
        </table>
      </div>
    );
  }
});

class TableRow extends React.Component {

   constructor() {
     super();
     this.state = {

     }
   }

   status(e){
     var value = e.target.checked;
     var taskname = e.target.parentNode.parentNode.childNodes[0].firstChild.nodeValue;
     $.ajax({
       type: 'post',
       url: '/change',
       data: {status: value , name: taskname },
       success: function(){
         console.log("Successful")
       }.bind(this)
     });
   }

   render() {
      var cts = this.props.data.deadline;
      var scheduledate = moment(cts).format('dddd, MMMM Do YYYY,[ at]  h:mm a');
      return (
         <tr>
            <td>{this.props.data.name}</td>
            <td>{this.props.data.completed? 'Completed' : 'Pending' }  </td>
            <td> <input type="checkbox" defaultChecked = {this.props.data.completed} onClick={this.status.bind(this)} className="status" /> </td>
            <td><a href={`/events/${this.props.data.event_id}`} > {this.props.data.event.name} </a></td>
            <td><a href= {`/users/${this.props.data.user_id}`} >{this.props.data.user_id ? this.props.data.user.name : ' ' } </a></td>
            <td> {scheduledate} </td>
            <td><a href={`/events/${this.props.data.event_id}/tasks/${this.props.data.id}`} > View Task </a></td>
         </tr>
      );
   }
}