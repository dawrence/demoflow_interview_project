/**
 * @file DemoList component.
 * Indexes demos
 */

import React, { useState, useEffect } from 'react'
import Button from '@material-ui/core/Button';

import GridList from '@material-ui/core/GridList';
import GridListTile from '@material-ui/core/GridListTile';
import GridListTileBar from '@material-ui/core/GridListTileBar';

import axios from 'axios';
import { useHistory } from 'react-router-dom'
import Paper from '@material-ui/core/Paper';

const DemoList = () => {

  const [demos, setDemos] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  let history = useHistory();

  const startPresentation = (id) => {
    setLoading(true);
    axios.post('/api/v1/presentations', { demo_id: id })
         .then((result) => {
            setLoading(false);
            history.push(`/presentation/${result.data.id}`)
          }
        ).catch((error) => {
          setLoading(false);
          alert(error);
        })
  }

  const fetchDemos = () => {
    return axios.get('/api/v1/demos')
    .then((result) => {
        setDemos(result.data);
        setLoading(false);
      })
    .catch((error) => {
        setError(error);
      }
    )
  };

  useEffect(()=>{
    fetchDemos();
  }, [])

  return (
    <div>
      <Paper>
        <GridList cellHeight={50} spacing={1}>
          { demos.length > 0 && demos.map(demo => {
              return (
                <GridListTile key={`demo-${demo.id}`} cols={2} rows={1}>
                  <GridListTileBar
                    title={demo.title}
                    titlePosition="top"
                    actionIcon={
                      <Button href="#" color="primary" onClick={(e) => {
                        e.preventDefault();
                        startPresentation(demo.id);
                      }}>
                        Start Presentation
                      </Button>
                    }
                    actionPosition="left"
                  />

                </GridListTile>
              );
            })
          }
        </GridList>
      </Paper>
    </div>
  );
};

export default DemoList;
