import React, {Component} from 'react';
import {GlobalHotKeys, HotKeys} from 'react-hotkeys';

export default class UDHotkeys extends Component {
  // state is for keeping control state before or after changes.

  GetHandlers() {
    var tbReturn = {};
    if (this.props.count === 1) {
      if (this.props.isEndpoint) {
        tbReturn[this.props.names] = () => this.onEndpointTrigger(this.props.handlers);
      }
      else {
        tbReturn[this.props.names] = () => eval(this.props.handlers);
      }
    }
    else {
      var curr = Number("0");
      this.props.names.map((e) => {
        var handler = this.props.handlers[curr];
        if (this.props.isEndpoint[curr]) {
          tbReturn[e] = () => this.onEndpointTrigger(handler);
        }
        else {
          tbReturn[e] = () => eval(handler);
        }
        curr++;
      }); 
    }
    return tbReturn
  };

  GetKeyMaps() {
    var tbReturn = {};
    if (this.props.count === 1) {
      tbReturn[this.props.names] = this.props.keyMap;
    }
    else {
      var curr = Number("0");
      this.props.names.map((e) => {
        tbReturn[e] = this.props.keyMap[curr];
        curr++;
      });
    }
    return tbReturn
  }

  onEndpointTrigger(id) {
    UniversalDashboard.publish('element-event', {
        type: 'clientEvent',
        eventId: id,
        eventName: 'onHotKey',
        eventData: false
    });
  }

  render() {
    const keyMap = this.GetKeyMaps()

    const handlers = this.GetHandlers();

    if (this.props.isGlobal) {
      return (
        <GlobalHotKeys 
          keyMap={keyMap} 
          handlers={handlers} 
          />
          );
    }
    else {
      var content = this.props.content;
        if (!Array.isArray(content))
        {
            content = [content]
        }
      content = content.map(x => {
        return UniversalDashboard.renderComponent(x);
      });
      return (
        <HotKeys keyMap={keyMap} handlers={handlers}>
          {content}
        </HotKeys>);
    }
  }
}