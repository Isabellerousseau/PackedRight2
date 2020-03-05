import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import { pullMessages, createMessage, deleteMessage } from '../plugins/messages';

initMapbox();
pullMessages();
createMessage();
deleteMessage();
