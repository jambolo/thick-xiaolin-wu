`
import './App.css';
import MainView from './MainView';
import React, { Component } from 'react';
`

class App extends Component
  constructor: (props) ->
    super(props)
    @state =
      value: 1
    return

  onValue: (v) =>
    @setState({ value: v })

  render: ->
    <div className="App">
      <MainView value={@state.value} app={this} />
    </div>
    
export default App
