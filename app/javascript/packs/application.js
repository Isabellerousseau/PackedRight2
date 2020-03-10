import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import {
  pullMessages,
  createMessage,
  deleteMessage
} from '../plugins/messages';

import { initChatChannel } from '../channels/chat_channel';
import { followDriver } from '../plugins/followDriver'

initMapbox();

pullMessages();
createMessage();
deleteMessage();

followDriver();
initChatChannel();
