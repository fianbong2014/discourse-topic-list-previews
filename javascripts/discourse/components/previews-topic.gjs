import Component from "@glimmer/component";
import { htmlSafe } from "@ember/template";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";
import concatClass from "discourse/helpers/concat-class";
import formatDate from "discourse/helpers/format-date";
import DButton from "discourse/components/d-button";
import { action } from "@ember/object";
import { service } from "@ember/service";
import icon from "discourse/helpers/d-icon";

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
            {{!-- <a
              href={{this.url}}
              data-topic-id={{@topic.id}}
              class="title"
            >{{htmlSafe @topic.fancyTitle}}
            </a> --}}
            <div class="card-header-f" style="padding: 1.5rem;">
                <div class="profile-f">
                    <img src="https://www.w3schools.com/images/lamp.jpg" alt="Profile Picture" />
                    <div>
                        <div><strong>{{@topic.last_poster_username}} </strong></div>
                        <div style="font-size: 0.6rem; color: gray;">
                            {{formatDate @topic.bumpedAtformat="medium-with-ago"noTitle="true"}}
                        </div>
                    </div>
                </div>
                <div class="save-icon">
                      {{!-- <i>🔖</i>--}}
                    {{icon "far-bookmark"}}
                </div>
            </div>
            {{~! no whitespace ~}}
        </PluginOutlet>
        {{~! no whitespace ~}}
    </template>
}