import React from 'react';
import { observable } from 'mobx';
import { observer } from 'mobx-react';
import { Form, FormGroup, Label, Input, Button, Alert } from 'reactstrap';
import { post } from '../utils/helper';

@observer
export default class FeedbackForm extends React.Component {
  @observable name;
  @observable comment;
  @observable response = 0;

  render() {
    return (
      <div>
        <Form>
          <FormGroup>
            <Label for="commentSource">Your name:</Label>
            <Input
              type="text"
              id="commentSource"
              value={this.name}
              onChange={(event) => { this.name = event.target.value; }}
            />
          </FormGroup>
          <FormGroup>
            <Label for="commentContent">Comment:</Label>
            <Input
              type="text"
              id="commentContent"
              value={this.comment}
              onChange={(event) => { this.comment = event.target.value; }}
            />
          </FormGroup>
          <Button
            type="submit"
            color='primary'
            onClick={(event) => {
              event.preventDefault();
              post('/api/feedbacks', {
                feedback: {
                  name: this.name,
                  comment: this.comment
                }
              }).then((response) => {
                this.response = response;
                this.name = '';
                this.comment = '';
              }).catch(() => {
                this.response = 'failure';
              });
            }}
          >
            Submit
          </Button>

        </Form>
        {this.response.message === 'success' && <Alert> Comment received </Alert>}
        {this.response === 'failure' && <Alert color="danger"> Invalid comment </Alert>}
      </div>
    );
  }
}
