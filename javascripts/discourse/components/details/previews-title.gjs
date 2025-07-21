import Component from "@glimmer/component";
import { htmlSafe } from "@ember/template";
import PluginOutlet from "discourse/components/plugin-outlet";

export default class PreviewsTitle extends Component {
    get url() {
        return this.args.topic.linked_post_number
            ? this.args.topic.urlForPostNumber(this.args.topic.linked_post_number)
            : this.args.topic.lastUnreadUrl;
    }
    <template>
      {{~! no whitespace ~}}
      <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}} />
  
      <div class="custom-topic-card">
        <a
          href={{this.url}}
          data-topic-id={{@topic.id}}
          class="custom-topic-link"
        >
          <div class="custom-topic-title">
            {{htmlSafe @topic.fancyTitle}}
          </div>
  
          {{#if @topic.excerpt}}
            <div class="custom-topic-excerpt">
              {{@topic.excerpt}}
            </div>
          {{/if}}
  
          {{#if @topic.thumbnails.length}}
            <img
              src={{@topic.thumbnails.0.url}}
              alt="thumbnail"
              class="custom-topic-thumbnail"
            />
          {{/if}}
  
          <div class="custom-topic-meta">
            🗨️ {{@topic.reply_count}} replies &nbsp;|&nbsp;
            👀 {{@topic.views}} views &nbsp;|&nbsp;
            👤 {{@topic.last_poster_username}} &nbsp;|&nbsp;
          </div>
        </a>
      </div>
    </template>
    
    
}
