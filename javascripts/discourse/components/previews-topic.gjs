// app/components/topic-link.gjs
import Component, { hbs } from '@glimmer/component';
import formatDate from "discourse/helpers/format-date";
import icon from "discourse/helpers/d-icon";
import lazyHash from "discourse/helpers/lazy-hash";

export default class TopicLink extends Component {
    get url() {
        return this.args.topic.linked_post_number
            ? this.args.topic.urlForPostNumber(this.args.topic.linked_post_number)
            : this.args.topic.lastUnreadUrl;
    }

    static template = hbs`
    <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}} as |outlet|>
      <div class="card-header-f" style="padding: 1.5rem;">
        <div class="profile-f" style="display: flex; gap: 0.75rem; align-items: center;">
          <img
            src="https://www.w3schools.com/images/lamp.jpg"
            alt="Profile Picture"
            style="width: 40px; height: 40px; border-radius: 9999px;"
          />
          <div>
            <div><strong>{{@topic.last_poster_username}}</strong></div>
            <div style="font-size: 0.6rem; color: gray;">
              {{format-date @topic.bumpedAt format="medium-with-ago" noTitle=true}}
            </div>
          </div>
        </div>
        <div class="save-icon" style="margin-left: auto;">
          {{d-icon "far-bookmark"}}
        </div>
      </div>
    </PluginOutlet>
  `;
}
