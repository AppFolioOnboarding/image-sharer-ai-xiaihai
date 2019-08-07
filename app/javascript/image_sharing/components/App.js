import React from 'react';
import { Container, Row, Col } from 'reactstrap';

import Header from './Header';
import Footer from './Footer';

export default function App() {
  return (
    <Container>
      <Row>
        <Col xs='3'> </Col>
        <Col xs='6'>
          <Header title='Tell us what you think' />
          <Footer />
        </Col>
      </Row>
    </Container>
  );
}
