/**
 * @file App component.
 */

 import React from 'react'
 import ReactDOM from 'react-dom'
 import { Alert, AlertTitle } from '@material-ui/lab';
 import axios from 'axios';

import Timestamp from './Timestamp';


const App = () => {
  return (
    <div>
      <h1>Demo APP</h1>
      <DemoList />
      <Timestamp />
    </div>
  );
};

export default App;
