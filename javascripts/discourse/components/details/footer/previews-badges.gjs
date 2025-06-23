import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { service } from "@ember/service";
import avatar from "discourse/helpers/avatar";


export default class PreviewsBadgesComponent extends Component {
  @service siteSettings;
  @service currentUser;
  @service modal;

  @tracked badges = []; // เก็บรายการ badge เพื่อแสดงใน template

   get creator() {
    console.log(this.args.topic);
    return this.args.topic.posters[0];
   }

  get abbrieviatedPosters() {
    let abbreviatedPosters = [];
    if (this.args.topic.posters.length < 6) {
      abbreviatedPosters = this.args.topic.posters;
    } else {
      this.args.topic.posters[0].count = false;
      abbreviatedPosters.push(this.args.topic.posters[0]);
      this.args.topic.posters[1].count = false;
      abbreviatedPosters.push(this.args.topic.posters[1]);
      let count = { count: this.args.topic.posters.length - 4 };
      abbreviatedPosters.push(count);
      this.args.topic.posters[this.args.topic.posters.length - 2].count = false;
      abbreviatedPosters.push(
        this.args.topic.posters[this.args.topic.posters.length - 2]
      );
      this.args.topic.posters[this.args.topic.posters.length - 1].count = false;
      abbreviatedPosters.push(
        this.args.topic.posters[this.args.topic.posters.length - 1]
      );
    }
    return abbreviatedPosters;
  }


  async loadBadges() {
    try {
      const username = this.args.topic.creator.username;
      //const apiUrl = settings; // get from args or settings

      
      
      if(settings?.api_url){
        const response = await fetch(`${settings?.api_url}/user/${username}/badges`);
        if (!response.ok) {
          throw new Error(`Failed to fetch badges: ${response.status}`);
        }
        const result = await response.json();

        // console.log(username, result);

        if (result.success) {
          this.badges = result.data;
        }
      }
      
    } catch (error) {
      console.error(error);
      this.badges = [];
      // Retry after 2 seconds
      // setTimeout(() => this.loadBadges(), 2000);
    }
    
  }


    <template>
        <div class="topic-users">
            <div class="inline">
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
            </div>
        </div>
    </template>
}