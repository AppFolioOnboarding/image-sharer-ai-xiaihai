/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import sinon from 'sinon';

import * as api from '../../utils/helper';
import FeedbackForm from '../../components/FeedbackForm';

describe('<FeedbackForm />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<FeedbackForm />);

    assert.strictEqual(wrapper.find('Form').length, 1);
    assert.strictEqual(wrapper.find('Form').at(0).find('FormGroup').length, 2);
    assert.strictEqual(wrapper.find('Label').length, 2);
    assert.strictEqual(wrapper.find('Input').length, 2);
    assert.strictEqual(wrapper.find('Form').at(0).find('Button').length, 1);

    assert.strictEqual(wrapper.find('Label').at(0).children().text(), 'Your name:');
    assert.strictEqual(wrapper.find('Label').at(1).children().text(), 'Comment:');
    assert.strictEqual(wrapper.find('Button').at(0).children().text(), 'Submit');
    assert.strictEqual(wrapper.find('Input').at(0).prop('type'), 'text');
    assert.strictEqual(wrapper.find('Input').at(1).prop('type'), 'textarea');
  });

  it('should set observable correctly', () => {
    const wrapper = shallow(<FeedbackForm />);
    wrapper.find('Input').first().simulate('change', { target: { value: 'something' } });
    assert.strictEqual(wrapper.instance().name, 'something');
  });

  it.only('should call post while button is clicked', () => {
    const wrapper = shallow(<FeedbackForm />);
    const stub = sinon.stub(api, 'post');
    stub.resolves({});

    wrapper.find('Button').first().simulate('click', { preventDefault: () => {} });

    assert(stub.calledOnce);
  });
});
