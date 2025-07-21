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
        console.log("Topic Data:", this.args.topic); // args.topic คือ @topic

        this.creator = this.args.topic.posters[0];
        this.loadBadges();

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
            {{~! no whitespace ~}}
            <div class="card-header-f" style="padding: 1.5rem;">
                <div class="profile-f">
                    {{!--  
                     <div class="topic-users">
                        <div class="inline">
                            <span class="topic-user-badge-list">
                                <a
                                    href={{this.creator.user.path}}
                                    data-user-card={{this.creator.user.username}}
                                    class={{this.creator.extras}}
                                >
                                    {{avatar
                                        this.creator
                                        avatarTemplatePath="user.avatar_template"
                                        usernamePath="user.username"
                                        imageSize="small"
                                    }}
                                </a>
                                <span class="topic-creator">{{this.creator.user.username}}</span>
                                {{#if this.badges.length}}
                                    {{#each this.badges as |badge|}}
                                        {{#if badge.allow_title}}
                                        <span class="topic-user-badge">
                                            {{#if badge.image_url}}
                                                <img src="{{badge.image_url}}" class="topic-badge-image" width="30" height="30" alt="{{badge.name}}"/>
                                            {{/if}}
                                            <span class="topic-badge-name">{{badge.name}}</span>
                                        </span>
                                        {{/if}}
                                    {{/each}}
                                {{/if}}
                             </span>
                        </div>
                    </div>
                    --}}
                    {{!--  <PreviewsBadges @topic={{@topic}} /> --}}
                    
                    
                    {{#with this.badges.firstObject as |badge|}}
                      {{#if badge.image_url}}
                        <img src="{{badge.image_url}}" class="topic-badge-image" alt="{{badge.name}}" />
                      {{/if}}
                    {{/with}}

                    {{!-- <img src="https://www.w3schools.com/images/lamp.jpg" alt="Profile Picture" data-oath="user.username" /> --}}
                    {{!-- start profile --}}
                    {{!-- end profile --}}
                    <div>
                        <div><strong>{{@topic.last_poster_username}} </strong></div>
                        <div style="font-size: 0.6rem; color: gray;">
                            {{formatDate @topic.last_posted_at format="medium-with-ago"}}
                        </div>
                    </div>
                </div>
                <div class="save-icon">
                    {{icon "bookmark"}}
                </div>
            </div>
            {{~! no whitespace ~}}
        </PluginOutlet>
        {{~! no whitespace ~}}
    </template>
}