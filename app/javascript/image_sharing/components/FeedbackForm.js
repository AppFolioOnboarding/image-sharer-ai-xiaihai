import React from 'react';
import { Form, FormGroup, Label, Input, Button } from 'reactstrap';

export default class FeedbackForm extends React.Component {
  render() {
    return (
      <Form>
        <FormGroup>
          <Label for="commentSource">Your name:</Label>
          <Input id="commentSource" />
        </FormGroup>
        <FormGroup>
          <Label for="commentContent">Comment:</Label>
          <Input type="textarea" id="commentContent" />
        </FormGroup>
        <Button type="submit" color='primary'>Submit</Button>
      </Form>
    );
  }
}
