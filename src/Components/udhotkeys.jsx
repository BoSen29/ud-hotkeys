import React, {Component} from 'react';
import {GlobalHotKeys, HotKeys} from 'react-hotkeys';

export default class UDHotkeys extends Component {

  GetHandlers() {
    var tbReturn = {};

    this.props.hotkeys.map((e) => {
      var handler = e.action
      if (e.isEndpoint) {
        tbReturn[e.name] = () => this.onEndpointTrigger(handler);
      }
      else {
        tbReturn[e.name] = () => eval(handler);
      }
    }); 
    return tbReturn
  };

  GetKeyMaps() {
    var tbReturn = {};
    this.props.hotkeys.map((e) => {
      tbReturn[e.name] = e.keyMap;
    });
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