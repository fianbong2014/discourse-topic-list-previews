import Component from "@glimmer/component";
import { htmlSafe } from "@ember/template";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";

export default class TopicLink extends Component {
  get url() {
    return this.args.topic.linked_post_number
      ? this.args.topic.urlForPostNumber(this.args.topic.linked_post_number)
      : this.args.topic.lastUnreadUrl;
  }

  <template>
    {{~! no whitespace ~}}
    <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}}>
      {{~! no whitespace ~}}
      <a
        href={{this.url}}
        data-topic-id={{@topic.id}}
        class="title"
      >{{htmlSafe @topic.fancyTitle}}
      </a>
       <div class="card-header-f">
        <div class="profile-f">
          <img src="https://www.w3schools.com/images/lamp.jpg" alt="Profile Picture" />
          <div>
            <div><strong>{{@topic.last_poster_username}} </strong></div>
            <div style="font-size: 0.8rem; color: gray;">โพสเมื่อ 3 ชั่วโมงที่แล้ว</div>
          </div>
        </div>
        <div class="save-icon">
          <i>🔖</i>
        </div>
      </div>
      {{~! no whitespace ~}}
    </PluginOutlet>
    {{~! no whitespace ~}}
  </template>
}