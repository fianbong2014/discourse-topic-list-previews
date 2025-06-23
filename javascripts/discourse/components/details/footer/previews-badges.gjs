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
  @tracked creator;

  constructor() {
    super(...arguments);
    this.creator = this.args.topic.posters[0];
    console.log(this.args.topic)
    this.loadBadges(); // โหลด badges เมื่อ component ถูกเรียก
    
  }



  async loadBadges() {
    try {
      const username = this.args.topic.creator.username;
      //const apiUrl = settings; // get from args or settings

      
      
      if(settings?.badge_api_url){
        const response = await fetch(`${settings?.badge_api_url}/user/${username}/badges`);
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
    </template>
}