import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import { pullMessages } from '../plugins/pull_new_messages';

initMapbox();
pullMessages();
