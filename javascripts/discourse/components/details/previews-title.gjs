﻿import Component from "@glimmer/component";
import { htmlSafe } from "@ember/template";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";

export default class PreviewsTitle extends Component {
    <template>
      {{~! no whitespace ~}}
      <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}}>
        {{~! no whitespace ~}}
        <a
          href={{this.url}}
          data-topic-id={{@topic.id}}
          class="title"
          style="padding-left: 1rem;padding-top: 1rem;"
       
        >{{htmlSafe @topic.fancyTitle}}</a>
        {{~! no whitespace ~}}
      </PluginOutlet>
      {{~! no whitespace ~}}
    </template>
}