import Component from "@glimmer/component";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";
import icon from "discourse/helpers/d-icon";
import formatDate from "discourse/helpers/format-date";
import avatar from "discourse/helpers/avatar";
// import PreviewsBadges from "./footer/previews-badges";

export default class TopicLink extends Component {
    get url() {
        return this.args.topic.linked_post_number
            ? this.args.topic.urlForPostNumber(this.args.topic.linked_post_number)
            : this.args.topic.lastUnreadUrl;
    }

    get abbrieviatedPosters() {
        let abbreviatedPosters = [];
        for(let i=1;i<this.args.topic.posters.length; i++){
            abbreviatedPosters.push(this.args.topic.posters[i]);
        }
        //console.log(abbreviatedPosters)
        return abbreviatedPosters;
    }
    

    <template>
        {{~! no whitespace ~}}
        <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}}>
            {{~! no whitespace ~}}
            <div class="card-header-f" style="padding: 1.5rem;">
                <div class="profile-f">
                    {{!--<img src="https://www.w3schools.com/images/lamp.jpg" alt="Profile Picture" /> --}}
                    {{!-- start profile --}}
                    <div class="topic-users">
                        <div class="inline">
                            {{#each this.abbrieviatedPosters as |poster|}}
                                {{#if poster.count}}
                                    ({{poster.count}})
                                {{else}}
                                    <a
                                        href={{poster.user.path}}
                                        data-user-card={{poster.user.username}}
                                        class={{poster.extras}}
                                    >
                                        {{avatar
                                            poster
                                            avatarTemplatePath="user.avatar_template"
                                            usernamePath="user.username"
                                            imageSize="small"
                                        }}
                                    </a>
                                {{/if}}
                            {{/each}}
                        </div>
                    </div>
                    {{!-- end profile --}}
                    
                    <div>
                        <div><strong>{{@topic.last_poster_username}} </strong></div>
                        <div style="font-size: 0.6rem; color: gray;">
                            {{!--{{formatDate @topic.bumpedAtformat="medium-with-ago"noTitle="true"}}--}}
                            {{formatDate @topic.last_posted_at format="medium-with-ago"}}
                        </div>
                    </div>
                </div>
                <div class="save-icon">
                    {{icon "bookmark"}}
                </div>
            </div>
            
            {{!--<div>
                <p>Test</p>
                <div class="topic-footer-badge">
                    <PreviewsBadges @topic={{@topic}} />
                </div>
            </div>--}}
            {{~! no whitespace ~}}
        </PluginOutlet>
        {{~! no whitespace ~}}
    </template>
}