import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import {
  pullMessages,
  createMessage,
  deleteMessage
} from '../plugins/messages';
import {orderDelivered} from "../plugins/delivered";
import {initOrderReview} from "../plugins/order_review.js";

import { initChatChannel } from '../channels/chat_channel';
import { initDriverChannel } from '../channels/driver_channel';

initMapbox();

pullMessages();
createMessage();
deleteMessage();

orderDelivered();
initOrderReview();

initChatChannel();
initDriverChannel();
