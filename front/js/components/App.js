/**
 * @file App component.
 */

import React from 'react';
import DemoList from './DemoList';
import Presentation from './Presentation';
import { Switch, Route } from 'react-router-dom'


import Timestamp from './Timestamp';

const App = () => {
  return (
    <div>
      <h5>Welcome to Demoflow!</h5>
      <Switch>
        <Route exact path='/' component={DemoList}/>
        <Route path='/presentation/:id' component={Presentation}/>
      </Switch>
    </div>
  );
};

export default App;
