import Component from "@glimmer/component";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";
import icon from "discourse/helpers/d-icon";
import formatDate from "discourse/helpers/format-date";
import avatar from "discourse/helpers/avatar";
import PreviewsBadges from "./details/footer/previews-badges";
export default class TopicLink extends Component {

    constructor() {
        super(...arguments);
        this.loadBadges();
        this.creator = this.args.topic.posters[0];
        console.log("Topic Data:", this.args.topic);
    }
    get url() {
        return this.args.topic.linked_post_number
            ? this.args.topic.urlForPostNumber(this.args.topic.linked_post_number)
            : this.args.topic.lastUnreadUrl;
    }

    async loadBadges() {
        try {
            const username = this.args.topic.creator.username;
            if(settings?.badge_api_url){
                const response = await fetch(`${settings?.badge_api_url}/user/${username}/badges`);
                if (!response.ok) {
                    throw new Error(`Failed to fetch badges: ${response.status}`);
                }
                const result = await response.json();
                if (result.success) {
                    this.badges = result.data;
                }
            }

        } catch (error) {
            console.error(error);
            this.badges = [];
        }
    }
    
    <template>
        {{~! no whitespace ~}}
        <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}}>
          <div class="card-header-f" style="padding: 1.5rem;">
            <div class="profile-f">
              {{#with this.badges.firstObject as |badge|}}
                {{#if badge.image_url}}
                  <img src="{{badge.image_url}}" class="topic-badge-image" width="30" height="30" alt="{{badge.name}}" />
                {{/if}}
              {{/with}}
        
              <div>
                <div><strong>{{@topic.last_poster_username}}</strong></div>
                <div style="font-size: 0.6rem; color: gray;">
                  {{formatDate @topic.last_posted_at format="medium-with-ago"}}
                </div>
              </div>
            </div>
            <div class="save-icon">
              {{icon "bookmark"}}
            </div>
          </div>
        </PluginOutlet>
        {{~! no whitespace ~}}
    </template>
}