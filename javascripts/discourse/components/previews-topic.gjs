import Component from "@glimmer/component";
import { htmlSafe } from "@ember/template";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";
import PreviewsBadges from "./footer/previews-badges";

export default class TopicLink extends Component {
  get url() {
    return this.args.topic.linked_post_number
      ? this.args.topic.urlForPostNumber(this.args.topic.linked_post_number)
      : this.args.topic.lastUnreadUrl;
  }
   get bookmarkClass() {
    return this.args.topic.bookmarked ? "bookmarked" : "";
  }

  get bookmarkTitle() {
    return this.args.topic.bookmarked ? "bookmarked" : "bookmark";
  }

  toggleBookmark() {
    // TODO: เพิ่ม logic การ bookmark ตามที่ต้องการ
    console.log("Toggle bookmark");
  }

  <template>
    <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}} />
    <a href={{this.url}} data-topic-id={{@topic.id}} class="title" >
      <div class="card">
      <!-- ส่วนที่ 1: โปรไฟล์ -->
      <div class="card-header">
        <div class="profile-custom">
          <img src="https://via.placeholder.com/40" alt="Profile Picture" />
          <div>
            {{!-- <PreviewsBadges @topic={{@topic}} /> 
            <div class="username">{{@topic.creator.username}}</div> --}}
            
            <div><strong>{{@topic.last_poster_username}}</strong></div>
            <div style="font-size: 0.8rem; color: gray;">
              {{!-- โพสเมื่อ 3 ชั่วโมงที่แล้ว --}}
               {{@topic.createdAt startDate=@topic.bumpedAt }}
            </div>
          </div>
        </div>

        
        <div class="save-icon">
          {{!-- <i>🔖</i> --}}
          <DButton
            @action={{this.toggleBookmark}}
            class={{concatClass
              "list-button btn-transparent topic-bookmark"
              this.bookmarkClass
            }}
            title={{i18n this.bookmarkTitle}}
            data-topic_id={{@topic.id}}
            data-topic_post_id={{@topic_post_id}}
            @icon="bookmark"
          />
           
        </div>
      </div>
    </div
    </a>
     
  </template>
}
