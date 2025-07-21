import Component from "@glimmer/component";

export default class PreviewsCategories extends Component {
    get categories() {
        const topic = this.args.topic;
        //console.log("ค่าที่ได้รับใน topic:", topic);
        console.log('topic.tags: ', topic.tags)
        return topic.tags;
    }
    
    <template>
        <div class="categories">
          🗂️ categories:
          {{#each this.categories as |category|}}
            <span class="badge-categories">{{category}}</span>
          {{/each}}
        </div>
    </template>
}
