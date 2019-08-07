/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import Footer from '../../components/Footer';

describe('<Footer />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<Footer />);

    assert.strictEqual(wrapper.find('footer').length, 1);
    assert.strictEqual(wrapper.find('footer').text(), ' Copyright: Appfolio Inc. Onboarding ');
  });
});
