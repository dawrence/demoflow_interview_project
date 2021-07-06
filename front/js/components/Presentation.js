/**
 * @file DemoList component.
 * Indexes demos
 */

import React, { useState, useEffect } from 'react'
import Button from '@material-ui/core/Button';
import Grid from '@material-ui/core/Grid';
import GridList from '@material-ui/core/GridList';
import GridListTile from '@material-ui/core/GridListTile';
import GridListTileBar from '@material-ui/core/GridListTileBar';
import axios from 'axios';
import { useHistory } from 'react-router-dom'
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';


const Presentation = (props) => {
  const presentation_id = parseInt(props.match.params.id, 10);
  const [slides, setSlides] = useState([]);
  const [loading, setLoading] = useState(false);
  const [actualContent, setActualContent] = useState('');
  let history = useHistory();

  const changeSlide = (slide_id) => {
    setLoading(true);
    axios.patch(`/api/v1/presentations/${presentation_id}`, { active_slide_id: slide_id })
         .then((result) => {
            setActualContent(result.data.active_slide.content);
            setLoading(false);
          }
        ).catch((error) => {
          setLoading(false);
          alert(error);
        })
  }

  const stopPresentation = () => {
    setLoading(true);
    axios.patch(`/api/v1/presentations/${presentation_id}`, { end_at: true })
         .then((result) => {
            let confirmed = confirm(result.data.time_spent);
            if(confirmed) {
              history.push('/');
              setLoading(false);
            }
          }
        ).catch((error) => {
          setLoading(false);
          alert(error);
        })
  }

  const fetchSlides = () => {
    setLoading(true);
    axios.get(`/api/v1/presentations/${presentation_id}`)
         .then((result) => {
            setSlides(result.data.slides);
            setLoading(false);
          }
        ).catch((error) => {
          setLoading(false);
          alert(error);
        })
  }

  useEffect(()=>{
    fetchSlides();
  }, [])

  return (
    <div>
      <Paper>
        <Grid container spacing={3}>
          <Grid item xs={3}>
            <GridList cellHeight={100} spacing={5}>
              { slides.length > 0 && slides.map(slide => {
                  return (
                    <GridListTile cols={2} rows={1} key={`slide-${slide.id}`} onClick={ () => changeSlide(slide.id)}>
                      {slide.content}
                      <GridListTileBar
                        title={slide.content}
                        titlePosition="top"
                        actionPosition="left"
                      />
                    </GridListTile>
                  );
                })
              }
            </GridList>
          </Grid>
          <Grid item xs={9}>
            {actualContent}
          </Grid>
          <Button href="#" color="primary" onClick={(e) => {
            e.preventDefault();
            stopPresentation(presentation_id);
          }}>
            Stop Presentation
          </Button>
        </Grid>
      </Paper>
    </div>
  );
};

export default Presentation;
