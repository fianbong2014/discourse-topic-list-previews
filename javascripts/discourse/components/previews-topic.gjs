import Component from "@glimmer/component";
import { action } from "@ember/object";
import { htmlSafe } from "@ember/template";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";

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

  @action
  toggleBookmark() {
    console.log("Toggle bookmark");
  }

  static styles = htmlSafe(`
    .topic-link-wrapper {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 12px;
      background: white;
      transition: box-shadow 0.2s ease;
      max-width: 600px;
    }
    .topic-link-wrapper:hover {
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .card-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .profile-custom {
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .profile-custom img {
      border-radius: 50%;
      width: 40px;
      height: 40px;
    }
    .posted-at {
      font-size: 0.8rem;
      color: gray;
    }
    .save-icon {
      font-size: 1.2rem;
      cursor: pointer;
    }
  `);

  // Template embedded as a string (for illustrative purposes)
  // In practice, Ember expects .hbs templates or co-location .gts files.
  // But this shows intent of single-file component.
  static template = `
    <div class="topic-link-wrapper">
      <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}} />
      <a href={{this.url}} data-topic-id={{@topic.id}} class="title">
        <div class="card">
          <div class="card-header">
            <div class="profile-custom">
              <img src="https://via.placeholder.com/40" alt="Profile Picture" />
              <div>
                <strong>{{@topic.last_poster_username}}</strong>
                <div class="posted-at">{{@topic.createdAt startDate=@topic.bumpedAt }}</div>
              </div>
            </div>
            <div class="save-icon">
              <DButton
                @action={{this.toggleBookmark}}
                class={{concatClass "list-button btn-transparent topic-bookmark" this.bookmarkClass}}
                title={{i18n this.bookmarkTitle}}
                data-topic_id={{@topic.id}}
                data-topic_post_id={{@topic_post_id}}
                @icon="bookmark"
              />
            </div>
          </div>
        </div>
      </a>
    </div>
  `;
}
