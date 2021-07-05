/**
 * @file DemoList component.
 * Indexes demos
 */

import React, { useState, useEffect } from 'react'
import Button from '@material-ui/core/Button';
import Grid from '@material-ui/core/Grid';
import axios from 'axios';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';


const DemoList = () => {

  const [demos, setDemos] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const fetchDemos = () => {
    return axios.get('/demos')
    .then((result) => {
        this.setDemos(result);
        this.setLoading(false);
      })
    .catch((error) => {
        this.setError(result)
      }
    )
  };

  useEffect(()=>{
    fetchDemos();
  }, [])

  return (
    <div>
      <Paper className={classes.paper}>
        <Grid container spacing={2}>
          { demos.length > 0 && demos.map(demo => {
              return (
                <Grid item>
                  <Typography noWrap>{demo.title}</Typography>
                  <Button variant="contained" color="primary" href="#contained-buttons">
                    Start Presentation
                  </Button>
                </Grid>
              );
            })
          }
        </Grid>
      </Paper>
    </div>
  );
};

export default DemoList;
