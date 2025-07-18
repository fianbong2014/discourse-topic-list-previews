import Component from "@glimmer/component";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";
import icon from "discourse/helpers/d-icon";
import formatDate from "discourse/helpers/format-date";
import PreviewsBadges from "./footer/previews-badges";

export default class TopicLink extends Component {
    get url() {
        return this.args.topic.linked_post_number
            ? this.args.topic.urlForPostNumber(this.args.topic.linked_post_number)
            : this.args.topic.lastUnreadUrl;
    }
    
    get getProfile(){
        console.log('hi')
    }


    <template>
        {{~! no whitespace ~}}
        <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}}>
            {{~! no whitespace ~}}
            <div class="card-header-f" style="padding: 1.5rem;">
                <div class="profile-f" onclick="this.getProfile">
                    <img src="https://www.w3schools.com/images/lamp.jpg" alt="Profile Picture" />
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
            
            <div>
                <p>Test</p>
                <div class="topic-footer-badge">
                    <PreviewsBadges @topic={{@topic}} />
                </div>
            </div>
            {{~! no whitespace ~}}
        </PluginOutlet>
        {{~! no whitespace ~}}
    </template>
}