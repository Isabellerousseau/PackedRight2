// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.

// import { createConsumer } from "@rails/actioncable"

// export default createConsumer()

import cable from "actioncable";

let consumer;

const createConsumer = (...args) => {
  if (!consumer) {
    consumer = cable.createConsumer();
  }

  return consumer.subscriptions.create(...args);
};

export default createConsumer
