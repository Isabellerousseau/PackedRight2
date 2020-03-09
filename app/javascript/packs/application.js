import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import {
  pullMessages,
  createMessage,
  deleteMessage
} from '../plugins/messages';
import { initChatChannel } from '../channels/chat_channel';

initMapbox();

pullMessages();
createMessage();
deleteMessage();

initChatChannel();
