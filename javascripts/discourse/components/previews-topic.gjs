import Component from "@glimmer/component";
import { htmlSafe } from "@ember/template";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";
import { formatAge } from "discourse/lib/formatter"; // ใช้แสดงเวลาย่อ ๆ เช่น "3h"

export default class TopicLink extends Component {
  get url() {
    return this.args.topic.linked_post_number
      ? this.args.topic.urlForPostNumber(this.args.topic.linked_post_number)
      : this.args.topic.lastUnreadUrl;
  }
  <template>
    <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}} />
     <div class="card">
      <!-- ส่วนที่ 1: โปรไฟล์ -->
      <div class="card-header">
        <div class="profile-custom">
          <img src="https://via.placeholder.com/40" alt="Profile Picture" />
          <div>
            <div><strong>{{@topic.last_poster_username}}</strong></div>
            {{!-- <div><PreviewsUsers @topic={{@topic}} /></div> --}}
            <div style="font-size: 0.8rem; color: gray;">
              {{!-- โพสเมื่อ 3 ชั่วโมงที่แล้ว --}}
               {{@topic.createdAt startDate=@topic.bumpedAt }}
            </div>
          </div>
        </div>
        <div class="save-icon">
          <i>🔖</i>
        </div>
      </div>
    </div
  </template>
}
