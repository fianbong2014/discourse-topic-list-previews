import Component from "@glimmer/component";

export default class PreviewsCategories extends Component {
    get categories() {
        const topic = this.args.topic;
        return topic.tags;
    }
    get hasCategories() {
        return this.categories.length > 0;
    }
    <template>
       {{#if this.hasCategories}}
          <div class="categories">
            categories:
            {{#each this.categories as |category|}}
              <span class="badge-categories">{{category}}</span>
            {{/each}}
          </div>
        {{/if}}
    </template>
}
